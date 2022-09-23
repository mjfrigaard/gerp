#' Fun script header <(+_+)>
#'
#' @param name
#'
#' @import purrr
#' @import rstudioapi
#' @export ger_fun_headr
#'
#' @examples # use this to create a fun section header in any .R file
#' # with RStudio running...
#' # geR2::fun_headr("import")
#'
#' @description The fun_headr function is similar to the hot keys
#' 'cmd + shift + R' for creating a section header.
ger_fun_headr <- function(name) {
    section_header <- paste0("# <(+_+)> ", name, " ––+––+––+––+––+––+––+––––+––+––+––––+––+ ----")
  purrr::map(.x = section_header, .f = rstudioapi::insertText)
}
