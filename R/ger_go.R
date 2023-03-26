#' NEW gerp project!
#'
#' @description
#' Create a new good enough R project
#'
#' @section Project functions:
#'
#' The following functions are imported from [usethis](https://github.com/r-lib/usethis/blob/0be0406d14d9816fd7f2457db4f7deaa958ac441/R/proj.R)
#'
#' ## Create project
#'
#' - `proj`: a new environment with `new.env(parent = emptyenv())`
#'
#' ## `get_()`, `active()`, `set()` projects
#'
#' - `proj_get_`: The current project (`proj_get_ <- function() proj$cur`)
#'
#' - `proj_active()`: is function created with `!is.null(proj_get_())`
#'
#' - `proj_set_()`: set `old` project path
#'
#'    ```
#'    proj_set_ <- function(path) {
#'        old <- proj$cur
#'        proj$cur <- path
#'        invisible(old)
#'    }
#'    ```
#'
#' - `proj_get()`: get the current project
#'
#'    ```
#'    proj_get <- function() {
#'    # Called for first time so try working directory
#'      if (!proj_active()) {
#'        usethis::proj_set(".")
#'      }
#'      proj_get_()
#'    }
#'    ```
#'
#' All of these result in the response from `usethis::proj_set(".")`:
#'
#' ```
#' ✔ Setting active project to '/path/to/current/project'
#' ```
#'
#' @section UI functions:
#'
#' ## UI function (from [usethis/R/ui.R](https://github.com/r-lib/usethis/blob/0be0406d14d9816fd7f2457db4f7deaa958ac441/R/ui.R))
#'
#'
#'
#' @param path path to new `gerp` project
#' @param rstudio check if RStudio is running
#' @param open is R running interactively?
#'
#' @return gerp project
#' @export ger_go
#'
#' @name ger_go
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

