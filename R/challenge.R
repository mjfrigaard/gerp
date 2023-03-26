# challenge_home_directory -------
#' @noRd
#'
#' @importFrom fs path_home path_home_r
#' @importFrom glue glue
challenge_home_directory <- function(path) {
  homes <- unique(c(fs::path_home(), fs::path_home_r()))
  if (!path %in% homes) {
    return(invisible())
  }

  qualification <- if (is_windows()) {
    glue::glue("a special directory, i.e. some applications regard it as ")
  } else {
    ""
  }
  ui_line("
    {ui_path(path)} is {qualification}your home directory.
    It is generally a bad idea to create a new project here.
    You should probably create your new project in a subdirectory.")
  if (ui_nope("Do you want to create anyway?")) {
    ui_stop("Good move! Cancelling project creation.")
  }
  invisible()
}


# challenge_nested_project ----
#' @noRd
#'
challenge_nested_project <- function(path, name) {
  if (!possibly_in_proj(path)) {
    return(invisible())
  }

  # creates an undocumented backdoor we can exploit when the interactive
  # approval is impractical, e.g. in tests
  if (isTRUE(getOption("usethis.allow_nested_project", FALSE))) {
    return(invisible())
  }
  ui_line(
    "New project {ui_value(name)} is nested inside an existing project \\
    {ui_path(path)}, which is rarely a good idea.
    If this is unexpected, the here package has a function, \\
    {ui_code('here::dr_here()')} that reveals why {ui_path(path)} \\
    is regarded as a project."
  )
  if (ui_nope("Do you want to create anyway?")) {
    ui_stop("Cancelling project creation.")
  }
  invisible()
}
