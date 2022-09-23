#' Create a new good enuff R project
#'
#' @import rstudioapi
#' @import fs
#' @import stringr
#' @importFrom stringr str_replace_all
#' @importFrom rstudioapi initializeProject
#' @importFrom rstudioapi openProject
#' @export ger_proj
#'
#' @description Create and open a new 'good enough' project.
#' @param parent_dir the parent folder of your project
#' @param proj_name name of your project
#' @details The `ger_proj()` function will open a new RStudio project.
#'     The `parent_dir` is the folder that will contain your new project, and
#'     the `proj_name` will be the name of the new sub-folder.
#'     To navigate folders on your computer, I like to use the `dir()` function.
#'     If you start with `dir("/")`, you should be able to find all the folders
#'     you have permissions to (probably best to start with `"/Users"`).
#' @examples # not run
#' # use dir() to find the parent folder path.
#' # ger_proj(parent_dir = "/Users/mjfrigaard/Documents/", "my new project")
ger_proj <- function(parent_dir, proj_name) {
  # check for folder_path
  fs::dir_create(path = parent_dir)
  # normalize the path to the computer
  folder_path <- base::suppressWarnings(base::normalizePath(parent_dir))
  # replace white-space
  no_white_space <- stringr::str_replace_all(proj_name, "\\s+", "_")
  # lowercase
  clean_project_name <- stringr::str_to_lower(no_white_space)
  # create path to project
  project_path <- base::paste0(folder_path, "/", clean_project_name, "/")
  # initialize project
  rstudioapi::initializeProject(path = project_path)
  # full project path (for opening in new session)
  rproj_full_project_path <- base::paste0(project_path, clean_project_name, ".Rproj")
  # # open new session
  rstudioapi::openProject(path = rproj_full_project_path, newSession = TRUE)
}
