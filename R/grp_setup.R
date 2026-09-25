#' Good enough R setup files
#'
#' @description
#' Create start-up files for a project (`changelog.md`, `CITATION`,
#' `requirements.md`, and `LICENSE`). Existing files are not overwritten.
#'
#' \describe{
#'   \item{changelog.md}{Manually document changes to the files or folders in your project.}
#'   \item{CITATION}{Information and example of how to cite your project.}
#'   \item{requirements.md}{Advice on how to manually list the requirements for your project.}
#'   \item{LICENSE}{The [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/) license.}
#' }
#'
#' @param path path to project folder
#'
#' @return `path` (invisibly)
#'
#' @export
#'
#' @examples
#' tmp <- file.path(tempdir(), "setup-example")
#' grp_setup(tmp)
grp_setup <- function(path = ".") {
  use_grp_template("changelog.md", fs::path(path, "changelog.md"),
    data = list(date = as.character(Sys.Date())))
  use_grp_template("citation.txt", fs::path(path, "CITATION"))
  use_grp_template("requirements.md", fs::path(path, "requirements.md"))
  use_grp_template("LICENSE", fs::path(path, "LICENSE"))
  invisible(path)
}
