#' Good enough code files
#'
#' @description
#' Create the `R/` folder with `import.R`, `tidy.R`, `wrangle.R`,
#' `visualize.R`, `model.R`, and `data.R` files. Existing files are not
#' overwritten.
#'
#' @param path path to project folder
#' @param roxygen logical, use a roxygen2 header (`TRUE`) or a standard script
#'    header (`FALSE`)?
#'
#' @return `path` (invisibly)
#'
#' @export
#'
#' @examples
#' tmp <- file.path(tempdir(), "code-example")
#' grp_code(tmp)
grp_code <- function(path = ".", roxygen = TRUE) {
  header <- if (isTRUE(roxygen)) "header-roxygen.R" else "header-script.R"
  code_files <- c("import.R", "tidy.R", "wrangle.R", "visualize.R", "model.R")
  for (f in code_files) {
    use_grp_template(header, fs::path(path, "R", f))
  }
  use_grp_template("data.R", fs::path(path, "R", "data.R"))
  invisible(path)
}
