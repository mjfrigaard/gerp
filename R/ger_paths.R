#' Get good enough file path(s)
#'
#' @param ... arguments passed to `dir()`
#' @param ext optional file extension (with or without the dot (`.`))
#' @param rel logical, relative or absolute path (default is relative)
#'
#' @return file path(s) that are either normalized (`rel = FALSE`) or relative.
#' @export ger_path
#'
#' @importFrom tools file_ext
#'
#' @examples
#' ger_path(".")
ger_path <- function(..., ext = NULL, rel = TRUE) {
  # no extension, absolute path
  if (is.null(ext) & isFALSE(rel)) {
    pth <- dir(..., full.names = TRUE)
    normalizePath(pth)
    # extension, absolute path
  } else if (!is.null(ext) & isFALSE(rel)) {
    raw_ext <- tools::file_ext(ext)
    dot_ptrn <- paste0("\\", ".", raw_ext, "$")
    no_dot_ptrn <- paste0("\\", raw_ext, "$")
    dot_ptrn[grepl("..", dot_ptrn)] <- paste0("\\", ext, "$")
    ptrn <- paste0(dot_ptrn, "|", no_dot_ptrn)
    pth <- dir(..., full.names = TRUE, pattern = ptrn)
    normalizePath(pth)
    # extension, relative path
  } else if (!is.null(ext) & isTRUE(rel)) {
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


