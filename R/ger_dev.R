#' Good enough R development folder
#'
#' @description
#' Create a `dev/` folder with `dev/notebook.Rmd` (a running lab notebook).
#'
#' @param path path to project folder
#'
#' @return `path` (invisibly)
#'
#' @export
#'
#' @examples
#' tmp <- file.path(tempdir(), "dev-example")
#' ger_dev(tmp)
ger_dev <- function(path = ".") {
  use_ger_template("notebook.Rmd", fs::path(path, "dev", "notebook.Rmd"))
  invisible(path)
}
