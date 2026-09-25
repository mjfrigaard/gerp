#' Good enough R report folder
#'
#' @description
#' Create a `report/` folder with `report/manuscript.Rmd` (a more polished R
#' Markdown file for reports or manuscripts).
#'
#' @param path path to project folder
#'
#' @return `path` (invisibly)
#'
#' @export
#'
#' @examples
#' tmp <- file.path(tempdir(), "report-example")
#' grp_report(tmp)
grp_report <- function(path = ".") {
  use_grp_template("manuscript.Rmd", fs::path(path, "report", "manuscript.Rmd"))
  invisible(path)
}
