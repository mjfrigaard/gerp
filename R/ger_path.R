#' Get good enough file path(s)
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


