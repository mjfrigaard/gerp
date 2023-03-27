#' NEW gerp project!
#'
#' @param path path to new `gerp` project
#' @param rstudio check if RStudio is running
#' @param open is R running interactively?
#'
#' @return gerp project
#'
#' @noRd
#'
#' @examples
#' # ger_go("path/to/folder")
ger_go <- function(path, rstudio = rstudioapi::isAvailable(), open = rlang::is_interactive()) {

  # converts to fs path
  path <- user_path_prep(path)

  # base name of directory
  name <- fs::path_file(fs::path_abs(path))

  # check if exists
  if (fs::dir_exists(path)) {
    ui_stop("Directory {ui_path(path)} already exists!")
  }

  # challenges
  challenge_nested_project(fs::path_dir(path), name)
  challenge_home_directory(path)

  create_directory(path)

  # setup
  ger_setup(folder_name = path)
  # code
  ger_code(folder_name = paste0(path, "/R"))
  # data
  ger_data(folder_name = path)
  # dev
  ger_dev(folder_name = path)
  # report
  ger_report(folder_name = path)

  # download README
  download.file(
    url = "https://raw.githubusercontent.com/mjfrigaard/gerp/main/inst/rmarkdown/templates/gerp-README/README.Rmd",
    destfile = paste0(path, "/", "README.Rmd"),
    quiet = TRUE)

  # create project file
  rstudioapi::initializeProject(path = path)

  # open new session
  rstudioapi::openProject(path = path, newSession = TRUE)

}

