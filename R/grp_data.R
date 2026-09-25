#' Good enough data folders
#'
#' @description
#' Create the data folders and a `data.md` file:
#'
#' \describe{
#'   \item{data-raw/}{code used to import, download and include data in your project}
#'   \item{data/}{processed, intermediate, or otherwise altered data in your project}
#'   \item{inst/extdata/}{external data used for examples or testing}
#'   \item{data.md}{document your data here and in `R/data.R`}
#' }
#'
#' @param path path to project folder
#'
#' @return `path` (invisibly)
#'
#' @export
#'
#' @examples
#' tmp <- file.path(tempdir(), "data-example")
#' grp_data(tmp)
grp_data <- function(path = ".") {
  fs::dir_create(fs::path(path, c("data", "data-raw", "inst/extdata")))
  use_grp_template("data.md", fs::path(path, "data.md"))
  invisible(path)
}
