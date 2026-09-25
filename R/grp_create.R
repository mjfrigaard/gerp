#' Create a new good enough R project
#'
#' @description
#' Create a new 'good enough' project folder with all the gerp files and
#' folders ([grp_setup()], [grp_code()], [grp_data()], [grp_dev()],
#' [grp_report()]), a `README.Rmd`, and an `.Rproj` file. The project is
#' opened in RStudio or Positron when `open = TRUE`.
#'
#' @param path path to the new project folder (must not exist)
#' @param open logical, open the new project?
#'
#' @return `path` (invisibly)
#'
#' @export
#'
#' @examples
#' tmp <- file.path(tempdir(), "my-project")
#' grp_create(tmp, open = FALSE)
grp_create <- function(path, open = interactive()) {
  path <- fs::path_abs(fs::path_expand(path))
  if (fs::file_exists(path)) {
    cli::cli_abort("{.path {path}} already exists.")
  }
  check_home_dir(path)
  check_nested_proj(fs::path_dir(path))

  fs::dir_create(path)
  cli::cli_alert_success("Creating {.path {path}}")
  grp_setup(path)
  grp_code(path)
  grp_data(path)
  grp_dev(path)
  grp_report(path)
  use_grp_template("README.Rmd", fs::path(path, "README.Rmd"))
  use_grp_template("project-rproj",
    fs::path(path, fs::path_ext_set(fs::path_file(path), "Rproj")))

  if (isTRUE(open)) {
    opened <- ide_call(rstudioapi::openProject, path = path, newSession = TRUE)
    if (is.null(opened)) {
      cli::cli_alert_info("Open {.path {path}} in your IDE to start working.")
    }
  }
  invisible(path)
}

#' @noRd
check_home_dir <- function(path) {
  homes <- unique(c(fs::path_home(), fs::path_home_r()))
  if (path %in% homes && !grp_confirm(
    "{.path {path}} is your home directory. Create a project here anyway?")) {
    cli::cli_abort("Cancelling project creation.")
  }
  invisible(path)
}

#' @noRd
check_nested_proj <- function(parent) {
  root <- tryCatch(
    rprojroot::find_root(proj_criteria(), path = parent),
    error = function(e) NULL
  )
  if (!is.null(root) && !grp_confirm(
    "{.path {parent}} is inside the project {.path {root}}. Create a nested project anyway?")) {
    cli::cli_abort("Cancelling project creation.")
  }
  invisible(parent)
}

#' @noRd
proj_criteria <- function() {
  rprojroot::is_rstudio_project |
    rprojroot::is_r_package |
    rprojroot::is_git_root |
    rprojroot::has_file(".here")
}
