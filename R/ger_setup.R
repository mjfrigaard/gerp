#' good enough R setup
#'
#' @importFrom readr write_lines
#' @importFrom fs file_create
#' @importFrom utils download.file
#'
#' @param folder_name path to project folder
#'
#' @export ger_setup
#'
#' @description
#' Create start-up files for project (`changelog.md`, `CITATION`,
#' `requirements.md`, and `LICENSE`)
#'
#' \describe{
#'   \item{changelog.md}{Manually document changes to the files or folders in your project.}
#'   \item{CITATION}{Information and example of how to cite your project}
#'   \item{requirements.md}{Advice on how to manually list the requirements for your project}
#'   \item{LICENSE}{Downloaded license from [creativecommons.org](https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt)}
#' }
#'
ger_setup <- function(folder_name = NULL) {
    tday <- as.character(Sys.Date())
    date_stamp <- paste0("## ", tday)
    changelog_content <- c("<!--\n...make dated notes about changes to the project in this file in reverse\nchronological order (i.e., most recent first). See examples below:\n-->", "\n# CHANGELOG", "=============\n", date_stamp, "\n* Created ref/ folder", "\n* Created ref/notebook.Rmd and ref/manuscript.Rmd", "\nSource: https://swcarpentry.github.io/good-enough-practices-in-scientific-computing/")

    citation_content <- c("Make the project citable (3e) by including a CITATION file in the project's home directory that describes how to cite this project as a whole, and where to find (and how to cite) any data sets, code, figures, and other artifacts that have their own DOIs.", "\n\n", "Please cite this work as:", "\nMorris, B.D. and E.P. White. 2013. 'The EcoData Retriever:", "improving access to existing ecological data.'PLOS ONE 8:e65848.", "http://doi.org/doi:10.1371/journal.pone.0065848")

requirements_content <- c("# Requirements", "===============\n", "Make dependencies and requirements explicit. This is usually done on a per-project rather than per-program basis, i.e., by adding a file called something like requirements.txt to the root directory of the project", "\n\nsource: https://swcarpentry.github.io/good-enough-practices-in-scientific-computing/")

  if (!is.null(folder_name)) {
    # changelog --------
    fs::file_create(paste0(folder_name, "/", "changelog.md"))
    readr::write_lines(
      x = changelog_content,
      file = paste0(folder_name, "/", "changelog.md")
    )
    # citation -----
    fs::file_create(paste0(folder_name, "/", "CITATION"))
    readr::write_lines(x = citation_content,
      file = paste0(folder_name, "/", "CITATION"))
    # requirements
    fs::file_create(paste0(folder_name, "/", "requirements.md"))
    readr::write_lines(x = requirements_content,
      file = paste0(folder_name, "/", "requirements.md"))
    # LICENSE
    utils::download.file(
      url = "https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt",
      destfile = paste0(folder_name, "/", "LICENSE"),
      quiet = TRUE)
  } else {
    # changelog --------
    fs::file_create("changelog.md")
    readr::write_lines(
      x = changelog_content,
      file = "changelog.md")
    # citation -----
    fs::file_create("CITATION")
    readr::write_lines(x = citation_content,
      file = "CITATION")
    # requirements
    fs::file_create("requirements.md")
    readr::write_lines(x = requirements_content, file = "requirements.md")
    # LICENSE
    utils::download.file(
      url = "https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt",
      destfile = "LICENSE",
      quiet = TRUE)
  }

}
