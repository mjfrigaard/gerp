#' @note NOTE: I did not write this code--it's imported from
#' [usethis/R/proj.R](https://github.com/r-lib/usethis/blob/0be0406d14d9816fd7f2457db4f7deaa958ac441/R/proj.R), with some variations.
#'

#' proj
#' @noRd
proj <- new.env(parent = emptyenv())

#' proj_get_
#' @noRd
proj_get_ <- function() proj$cur

#' proj_active
#' @noRd
proj_active <- function() !is.null(proj_get_())

#' proj_set_
#' @noRd
proj_set_ <- function(path) {
  old <- proj$cur
  proj$cur <- path
  invisible(old)
}

#' proj_get
#' @noRd
proj_get <- function() {
  # Called for first time so try working directory
  if (!proj_active()) {
    usethis::proj_set(".")
  }
  proj_get_()
}

#' is_in_proj
#' @noRd
#'
#' @importFrom fs path_common path_expand path_abs
#'
#' @description
#'  check if is path from `path_get()` is identical to
#' `fs::path_common(c(proj_get(), fs::path_expand(fs::path_abs(path))))`
is_in_proj <- function(path) {
  if (!proj_active()) {
    return(FALSE)
  }
  identical(
    proj_get(),
    ## use path_abs() in case path does not exist yet
    fs::path_common(c(proj_get(), fs::path_expand(fs::path_abs(path))))
  )
}

#' proj_rel_path
#'
#' @description
#' Project relative path (from `usethis::proj_get()`)
#'
#' @noRd
#'
#' @importFrom usethis proj_get
#' @importFrom fs path_rel
#'
#'
#' @return project relative path
#'
proj_rel_path <- function(path) {
  if (is_in_proj(path)) {
    as.character(fs::path_rel(path, start = usethis::proj_get()))
  } else {
    path
  }
}

#' proj_crit
#'
#' @description
#' Critical checks for project
#'
#' @noRd
proj_crit <- function() {
  rprojroot::has_file(".here") |
    rprojroot::is_rstudio_project |
    rprojroot::is_r_package |
    rprojroot::is_git_root |
    rprojroot::is_remake_project |
    rprojroot::is_projectile_project
}

#' proj_find
#'
#' @description
#' find the root of hierarchy (from `rprojroot::find_root()`)
#'
#'
#' @noRd
#'
#' @importFrom rprojroot find_root
proj_find <- function(path = ".") {
  tryCatch(
    rprojroot::find_root(proj_crit(), path = path),
    error = function(e) NULL
  )
}

#' possibly_in_proj
#' @noRd
possibly_in_proj <- function(path = ".") !is.null(proj_find(path))
