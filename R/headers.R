#' Insert a 'good enough' R script header
#'
#' @description
#' Insert a script header at the cursor in RStudio or Positron. The header
#' includes sections for what the code creates, who the author is, the
#' license, and the version.
#'
#' @return the header text (invisibly)
#'
#' @export
#'
#' @examples
#' # with RStudio or Positron running:
#' # ger_headr()
ger_headr <- function() {
  rule <- strrep("~", 69)
  header <- paste0(
    "#", rule, "#\n",
    "# This is code to create:\n",
    "# Authored by and feedback to:\n",
    "# MIT License\n",
    "# Version:\n",
    "#", rule, "#\n"
  )
  insert_text(header)
}

#' Insert a fun R script section header `<(+_+)>`
#'
#' @description
#' Insert a section header at the cursor in RStudio or Positron (similar to
#' `Cmd/Ctrl + Shift + R`).
#'
#' @param name section name
#'
#' @return the section header text (invisibly)
#'
#' @export
#'
#' @examples
#' # with RStudio or Positron running:
#' # ger_sect("import")
ger_sect <- function(name) {
  header <- paste0("# <(+_+)> ", name, " ", strrep("--+", 16), " ----\n")
  insert_text(header)
}

#' Insert text at the cursor, or print it if no IDE is available
#'
#' @noRd
insert_text <- function(text) {
  if (is.null(ide_call(rstudioapi::insertText, text = text))) {
    cat(text)
  }
  invisible(text)
}
