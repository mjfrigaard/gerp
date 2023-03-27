#' Create `files_tbl` table
#'
#' @param path path to files to be renamed
#' @param ... additional args passed to `fs::dir_info()`
#'
#' @return tibble with file and date info
#'
#' @importFrom fs dir_info path_dir
#' @importFrom lubridate as_date
#' @importFrom tools file_ext file_path_sans_ext
#' @importFrom dplyr mutate select starts_with contains across
get_files_tbl <- function(path, ...) {

  all_files <- fs::dir_info(path = path, ..., type = "file")

  file_tbl <- dplyr::mutate(all_files,
    file_path = as.character(path),
    file_folder = as.character(fs::path_dir(path)),
    file_full_name = as.character(basename(path)),
    file_extension = paste0(".", tools::file_ext(file_full_name)),
    file_name = tools::file_path_sans_ext(file_full_name))

  date_tbl <- dplyr::mutate(file_tbl,
    dplyr::across(dplyr::contains('time'), lubridate::as_date))

  files_tbl <- dplyr::select(date_tbl, dplyr::starts_with('file'),
    modification = modification_time,
    access = access_time,
    change = change_time,
    birth = birth_time)

  return(files_tbl)

}

#' Create `date_prefix` column (utility)
#'
#' @param files data.frame or tibble from `get_files_tbl()` function
#' @param prefix date prefix (`"modification"`, `"access"`, `"change"`, or
#'  `"birth"`)
#'
#' @return tibble with date prefix column
#'
#' @importFrom rlang sym
#' @importFrom glue glue
#' @importFrom cli cli_abort
#' @importFrom dplyr mutate select
get_date_prefix <- function(files, prefix = "birth") {
  prefixes <- c("modification", "access", "change", "birth")
  if (prefix %in% prefixes) {
    time_col <- rlang::sym(prefix)
    date_prefix_col <- dplyr::mutate(.data = files,
      date_prefix = paste0(!!time_col, "_")
  )
    date_prefix_tbl <- dplyr::select(date_prefix_col,
      file_path, file_folder, file_full_name,
      file_extension, file_name, date_prefix)
    return(date_prefix_tbl)
  } else {
    cli::cli_abort(glue::glue("{prefix} is not one of the available options"))
  }
}

#' Clean `file_name` column (utility)
#'
#' @param df data.frame or tibble
#' @param column file name column (without extension)
#'
#' @return tibble with clean file names
#'
#' @importFrom snakecase to_snake_case
#' @importFrom stringr str_replace_all
#' @importFrom dplyr mutate select
get_clean_file_names <- function(df, column) {
  clean_file_names_cols <- dplyr::mutate(df,
    snakes := snakecase::to_snake_case({{column}}),
    hyphens = stringr::str_replace_all(snakes, "[^[:alnum:].]+", "-"),
    clean_file_name = paste0(date_prefix, hyphens, file_extension),
    clean_file_path = paste0(file_folder, "/", clean_file_name)
    # "clean_{{column}}_path" := paste0(date_prefix, hyphens, file_extension)
    )

  clean_file_names_tbl <- dplyr::select(clean_file_names_cols,
    clean_file_name, clean_file_path, file_full_name, file_path)

  return(clean_file_names_tbl)
}



#' Rename all files (utility)
#'
#' @param old previous names
#' @param new new names
#'
#' @return quietly returns the output from `purrr::walk2`
#'
#' @importFrom purrr walk2
rename_all_files <- function(old, new) {
  purrr::walk2(.x = old, .y = new, .f = file.rename, .progress = TRUE)
}

#' Rename all files in a folder
#'
#' @param path path to folder
#' @param prefix date prefix (`"modification"`, `"access"`, `"change"`, or
#'  `"birth"`)
#'
#' @return returns the output from `purrr::walk2`
#' @export ger_batch_rename
#'
#' @importFrom fs dir_tree
ger_batch_rename <- function(path, prefix) {

  pth <- fs::as_fs_path(path)

  files_tbl <- get_files_tbl(path = pth)

  file_date <- get_date_prefix(files = files_tbl)

  clean_tbl <- get_clean_file_names(file_date, file_name)

  new_names <- clean_tbl[['clean_file_path']]
  old_names <- clean_tbl[['file_path']]

  rename_all_files(old = old_names, new = new_names)

}
