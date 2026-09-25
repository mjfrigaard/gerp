#' Rename all files in a folder
#'
#' @description
#' Rename every file in `path` with a date prefix (`YYYY-MM-DD_`) and a clean,
#' lowercase, hyphenated name (see [ger_fname()]). Files that already start
#' with a date prefix are skipped.
#'
#' @param path path to folder
#' @param prefix which file date to use for the prefix (`"modification"`,
#'    `"birth"`, `"access"`, or `"change"`). `"birth"` falls back to
#'    `"modification"` on systems that don't record it.
#' @param dry_run logical, preview the new names without renaming?
#'
#' @return a data.frame with the `old` and `new` file paths (invisibly unless
#'    `dry_run = TRUE`)
#'
#' @export
#'
#' @examples
#' tmp <- file.path(tempdir(), "rename-example")
#' dir.create(tmp)
#' file.create(file.path(tmp, c("My File.txt", "Joe's DATA (final).csv")))
#' ger_batch_rename(tmp, dry_run = TRUE)
ger_batch_rename <- function(path,
                             prefix = c("modification", "birth", "access", "change"),
                             dry_run = FALSE) {
  prefix <- match.arg(prefix)
  if (!fs::dir_exists(path)) {
    cli::cli_abort("{.path {path}} is not a folder.")
  }
  info <- fs::dir_info(path, type = "file")
  info <- info[!grepl("^\\d{4}-\\d{2}-\\d{2}_", fs::path_file(info$path)), ]
  if (nrow(info) == 0) {
    cli::cli_alert_info("No files to rename in {.path {path}}")
    return(invisible(data.frame(old = character(), new = character())))
  }

  dates <- info[[paste0(prefix, "_time")]]
  if (prefix == "birth" && anyNA(dates)) {
    cli::cli_warn("Birth times unavailable, using modification times.")
    dates <- info$modification_time
  }

  old <- as.character(info$path)
  new_nm <- ger_fname(fs::path_file(old), date = as.Date(dates), clip = FALSE)
  new <- as.character(fs::path(fs::path_dir(old), new_nm))
  out <- data.frame(old = old, new = new)

  if (isTRUE(dry_run)) {
    return(out)
  }
  fs::file_move(old, new)
  cli::cli_alert_success("Renamed {length(old)} file{?s} in {.path {path}}")
  invisible(out)
}
