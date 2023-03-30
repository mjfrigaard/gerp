#' Quickly create new gerp project
#'
#' @return downloaded `gerp` project (named `new_project`)
#' @export ger_proj
#'
#' @description
#' Wrapper around `usethis::use_course()` (for downloading a new `gerp` project)
#'
#'
#' @examples
#' # ger_proj()
ger_proj <- function() {
  usethis::use_course(url = "bit.ly/3JYCfnT")
}
