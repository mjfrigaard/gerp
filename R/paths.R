#' Get file path(s)
#'
#' @description
#' Use `ger_path()` to view folder and file paths. Absolute paths are the
#' exact location of a file or folder in the file system (they start with the
#' root folder). Relative paths start from the current working directory.
#'
#' @param path file or folder path
#' @param type absolute (`"abs"`) or relative (`"rel"`) path
#' @param tree logical, print a folder tree?
#'
#' @return path(s) (invisibly if `tree = TRUE`)
#'
#' @export
#'
#' @examples
#' ger_path(".")
#' ger_path(tempdir(), type = "rel")
ger_path <- function(path = ".", type = c("abs", "rel"), tree = FALSE) {
  type <- match.arg(type)
  out <- switch(type,
    abs = fs::path_abs(path),
    rel = fs::path_rel(path)
  )
  if (isTRUE(tree)) {
    fs::dir_tree(fs::path_abs(path), recurse = FALSE)
    return(invisible(out))
  }
  out
}

#' Get the root folder of your project
#'
#' @description
#' Find the project root by looking upwards for an `.Rproj` file, an R
#' package `DESCRIPTION`, a `.git` folder, or a `.here` file (so it works in
#' both RStudio and Positron).
#'
#' @param path path to start searching from
#' @param tree logical, print a folder tree?
#'
#' @return root path (invisibly if `tree = TRUE`)
#'
#' @export
#'
#' @examples
#' # ger_root()
#' # ger_root(tree = TRUE)
ger_root <- function(path = ".", tree = FALSE) {
  root <- fs::path(rprojroot::find_root(proj_criteria(), path = path))
  if (isTRUE(tree)) {
    fs::dir_tree(root, recurse = FALSE)
    return(invisible(root))
  }
  root
}

#' Get the path of the current file
#'
#' @description
#' Return the path to the file open in the RStudio or Positron editor.
#'
#' @param tree logical, print a folder tree?
#'
#' @return file path (invisibly if `tree = TRUE`)
#'
#' @export
#'
#' @examples
#' # with RStudio or Positron running:
#' # ger_fpath()
ger_fpath <- function(tree = FALSE) {
  ctx <- ide_call(rstudioapi::getSourceEditorContext)
  if (is.null(ctx) || !isTRUE(nzchar(ctx$value$path))) {
    cli::cli_abort("No saved file is open in RStudio or Positron.")
  }
  pth <- fs::path_abs(ctx$value$path)
  if (isTRUE(tree)) {
    fs::dir_tree(fs::path_dir(pth), recurse = FALSE)
    return(invisible(pth))
  }
  pth
}

#' Look up a file or folder in your project
#'
#' @description
#' Search the project (from [ger_root()]) for files or folders named `x` and
#' print a folder tree for each match.
#'
#' @param x file or folder name to search for (e.g., `"README.Rmd"`)
#' @param path path to search (defaults to the project root)
#'
#' @return matching path(s) (invisibly)
#'
#' @export
#'
#' @examples
#' # ger_lkp_path("README.Rmd")
#' # ger_lkp_path("inst")
ger_lkp_path <- function(x, path = ger_root()) {
  found <- fs::dir_ls(path, recurse = TRUE, all = FALSE)
  found <- found[fs::path_file(found) == x]
  if (length(found) == 0) {
    cli::cli_alert_info("No match for {.file {x}} in {.path {path}}")
    return(invisible(found))
  }
  for (dir in unique(fs::path_dir(found))) {
    fs::dir_tree(dir, recurse = FALSE, glob = paste0("*/", x))
  }
  invisible(found)
}
