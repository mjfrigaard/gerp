#' Download REAME.Rmd for project
#' @noRd
#'
#' @importFrom fs file_show
ger_readme <- function(path = ".", open = TRUE) {
    download.file(
    url = "https://raw.githubusercontent.com/mjfrigaard/gerp/main/inst/rmarkdown/templates/gerp-README/README.Rmd",
    destfile = paste0(path, "/", "README.Rmd"),
    quiet = TRUE)

  if (isTRUE(open)) {
    fs::file_show(paste0(path, "/", "README.Rmd"))
  }
}
