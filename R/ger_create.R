#' Create a new good enough R project
#'
#' @importFrom snakecase to_snake_case
#' @importFrom rstudioapi initializeProject openProject
#' @importFrom fs path_expand
#' @export ger_create
#'
#' @description
#' Create and open a new 'good enough' project.
#'
#' @param folder the parent folder of your project
#' @param name name of your project
#'
#' @details this function will open a new RStudio project. The `folder` is
#' the parent folder that will contain your new project, and the `name` will
#' be the name of your project sub-folder.
#' To navigate folders on your computer, I like to use `ger_path()` function.
#' If you start with `ger_path("/")`, you should be able to find all the
#' folders you have permissions to (probably best to start with `"/Users"`).
#'
#'
#' @examples # not run
#' # ger_create(folder = tempdir(), "my project 01")
ger_create <- function(folder, name) {
  proj_dir <- fs::path_expand(path = folder)
  proj_name <- snakecase::to_snake_case(name)
  proj_path <- fs::path_expand(paste0(proj_dir, "/", proj_name))
  ger_go(path = proj_path)
}

