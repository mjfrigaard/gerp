#' Insert 'good enough' R script header
#'
#' @importFrom purrr map
#' @importFrom rstudioapi insertText
#' @export ger_headr
#'
#'
#' @description The `ger_headr()` function can be used in a new R script
#'     to create a header. The header includes sections for:
#' * what the code creates
#'
#' * who the author is
#'
#' * an MIT License
#'
#' * Version
#'
#' @examples # use this to create a script header (with RStudio open)
#' # ger_headr("import")
ger_headr <- function() {
  script_header <- c("#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#\n# This is code to create:\n# Authored by and feedback to:\n# MIT License\n# Version:\n#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#\n")
  purrr::map(.x = script_header, .f = rstudioapi::insertText)
}

#' Fun script header `<(+_+)>`
#'
#' @param name
#'
#' @importFrom purrr map
#' @importFrom rstudioapi insertText
#' @export ger_sect
#'
#' @examples # use this to create a fun section header in any .R file
#' # with RStudio running...
#' # gerp::fun_headr("import")
#'
#' @description The `fun_headr()` function is similar to the hot keys
#' 'cmd + shift + R' for creating a section header.
ger_sect <- function(name) {
    section_header <- paste0("# <(+_+)> ", name, " ––+––+––+––+––+––+––+––––+––+––+––––+––+ ----")
  purrr::map(.x = section_header, .f = rstudioapi::insertText)
}
