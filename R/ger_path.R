#' Get good enough file path(s)
#'
#' @param ... arguments passed to `dir()`
#' @param ext optional file extension (with or without the dot (`.`))
#' @param type logical, relative or absolute path (default is absolute)
#'
#' @description Use `ger_path()` to view folder and file paths.
#' \describe{
#'   \item{ext}{An optional file extension argument (i.e., `".csv"`)}
#'   \item{type}{Return the relative or absolute path. The default is a relative path, which is the location of a file or folder **relative to the current working directory (or folder)**. This means that it doesn't start with the root directory, but with the directory that you're currently in. Absolute paths are the exact location of a file or folder in the file system hierarchy. They begin with the root folder and includes all folders and subfolders necessary to locate the file or folder.}
#' }
#'
#' @return file path(s) that are either normalized (`type = FALSE`) or relative.
#' @export ger_path
#'
#' @importFrom tools file_ext
#'
#' @examples
#' ger_path(".")
ger_path <- function(..., ext = NULL, type = TRUE) {
  # no extension, absolute path
  if (is.null(ext) & isFALSE(type)) {
    pth <- dir(..., full.names = TRUE)
    normalizePath(pth)
    # extension, absolute path
  } else if (!is.null(ext) & isFALSE(type)) {
    raw_ext <- tools::file_ext(ext)
    dot_ptrn <- paste0("\\", ".", raw_ext, "$")
    no_dot_ptrn <- paste0("\\", raw_ext, "$")
    dot_ptrn[grepl("..", dot_ptrn)] <- paste0("\\", ext, "$")
    ptrn <- paste0(dot_ptrn, "|", no_dot_ptrn)
    pth <- dir(..., full.names = TRUE, pattern = ptrn)
    normalizePath(pth)
    # extension, relative path
  } else if (!is.null(ext) & isTRUE(type)) {
    raw_ext <- tools::file_ext(ext)
    dot_ptrn <- paste0("\\", ".", raw_ext, "$")
    no_dot_ptrn <- paste0("\\", raw_ext, "$")
    dot_ptrn[grepl("..", dot_ptrn)] <- paste0("\\", ext, "$")
    ptrn <- paste0(dot_ptrn, "|", no_dot_ptrn)
    dir(..., full.names = TRUE, pattern = ptrn)
    # no extension, relative path
  } else {
     dir(..., full.names = TRUE)
  }
}


