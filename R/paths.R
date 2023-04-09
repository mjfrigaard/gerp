#' Get current file path
#'
#' @param tree logical, return a folder tree?
#'
#' @return current file path or current file path + folder tree
#' @export ger_fpath
#'
#' @examples
#' # ger_fpath()
ger_fpath <- function(tree = FALSE) {
  if (isTRUE(tree)) {
    act_src_pth <- tools::file_path_as_absolute(
                        x = rstudioapi::getSourceEditorContext()$path)
    parent_dir <- dirname(path = act_src_pth)
    file_nm <- base::basename(path = act_src_pth)
    return(fs::dir_tree(path = parent_dir, regexp = file_nm))
  return()
  } else {
    act_src_pth <- tools::file_path_as_absolute(
                      x = rstudioapi::getSourceEditorContext()$path)
    return(cat(noquote(as.character(act_src_pth))))
  }
}
#' Get the root folder of your project
#'
#' @param tree logical, return a folder tree?
#'
#' @return path or path + folder tree
#' @export ger_root
#'
#' @importFrom rprojroot find_root_file is_rstudio_project
#' @importFrom fs dir_tree as_fs_path
#'
#' @examples
#' ger_root()
#' ger_root(tree = TRUE)
ger_root <- function(tree = FALSE) {
  if (isTRUE(tree)) {
  root_proj_pth <- rprojroot::find_root_file(
                          criterion = is_rstudio_project, path = ".")
  fs::dir_tree(root_proj_pth, recurse = FALSE)
  } else {
    root_proj_pth <- rprojroot::find_root_file(
                          criterion = is_rstudio_project, path = ".")
    cat(noquote(as.character(root_proj_pth)))
  }
}

#' Get look-up file paths
#'
#' @param look_for_file character string of file (with extension)
#'
#' @return lk4_pths path(s) to file
#'
#' @importFrom rprojroot find_root_file is_rstudio_project
#' @importFrom fs dir_ls
#'
#' @noRd
#'
#' @keywords internal
get_lk4_paths <- function(look_for_file) {
    rgx <- paste0(as.character(look_for_file), "$")
    root_pth <- rprojroot::find_root_file(
                          criterion = is_rstudio_project, path = ".")
      lk4_pths <- fs::dir_ls(path = root_pth, recurse = TRUE,
                             regexp = rgx)

      return(lk4_pths)
}
#' Make look-up file trees
#'
#' @param lk4_pths output from `get_lk4_paths()`
#'
#' @return file tree(s)
#'
#' @importFrom rprojroot find_root_file is_rstudio_project
#' @importFrom purrr walk map_vec
#' @importFrom fs dir_tree
#'
#' @noRd
#' @keywords internal
make_lk4_trees <- function(lk4_pths) {
  if (length(lk4_pths) > 0 & length(lk4_pths) < 2) {
    dir_found <- dirname(lk4_pths)
    found_file <- base::unname(purrr::map_vec(lk4_pths, base::basename))
    found_file_rgx <- unique(paste0(found_file, "$"))
    fs::dir_tree(dir_found, recurse = FALSE, regexp = found_file_rgx)
  } else {
    found_files <- base::unname(purrr::map_vec(lk4_pths, base::basename))
    found_file_rgx <- unique(paste0(found_files, "$"))
    dir_found <- base::unname(purrr::map_vec(lk4_pths, dirname))
    suppressWarnings(
          purrr::walk(dir_found,
                fs::dir_tree,
                    recurse = TRUE,
                    regexp = found_file_rgx)
      )

  }
}
#' Get look-up file/folder tree path
#'
#' @param x file or folder to search for
#'
#' @return file tree(s)
#' @export ger_lkp_path
#'
#'
#' @examples
#' gerp::ger_lkp_path("inst")
#' gerp::ger_lkp_path("README.Rmd")
ger_lkp_path <- function(x) {
  lk4_pths <- get_lk4_paths(look_for_file = x)
  make_lk4_trees(lk4_pths = lk4_pths)
}

#' Get file path(s)
#'
#' @param ... arguments passed to `fs::path_abs()`
#' @param type logical, relative (`"rel"`) or absolute (`"abs"`) path (default
#' is absolute)
#' @param tree logical, return a folder tree (via `fs::dir_path()`)?
#'
#' @description Use `ger_path()` to view folder and file paths.
#' \describe{
#'   \item{type}{Return the relative or absolute path. The default is a relative path, which is the location of a file or folder **relative to the current working directory (or folder)**. This means that it doesn't start with the root directory, but with the directory that you're currently in. Absolute paths are the exact location of a file or folder in the file system hierarchy. They begin with the root folder and includes all folders and subfolders necessary to locate the file or folder.}
#' }
#'
#' @return file path(s) that are either normalized (`type = FALSE`) or relative.
#' @export ger_path
#'
#' @importFrom fs path_abs path_file dir_tree
#'
#' @examples
#' # ger_path(".")
ger_path <- function(..., tree = FALSE, type = "abs") {
  # absolute path
  if (isTRUE(tree) & type == "abs") {
    path_fs <- fs::path_abs(path = ...)
    return_path <- as.character(path_fs)
    fs::dir_tree(return_path,
      recurse = FALSE,
      type = c("directory", "file")
    )
  } else if (isFALSE(tree) & type == "abs") {
    path_fs <- fs::path_abs(path = ...)
    return_path <- as.character(path_fs)
    return(return_path)
  } else if (isTRUE(tree) & type == "rel") {
    return_path <- fs::path_file(fs::path_abs(path = ...))
    cli::cli_alert_info("Can't return a folder tree on a relative path")
    return(return_path)
  } else {
    return_path <- fs::path_file(fs::path_abs(path = ...))
    return(return_path)
  }
}
