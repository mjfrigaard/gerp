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
#' # grp_headr()
grp_headr <- function() {
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

#' Insert an R script section header
#'
#' @description
#' Insert a section header at the cursor in RStudio or Positron (similar to
#' `Cmd/Ctrl + Shift + R`). Use `level` to nest sections in the document
#' outline.
#'
#' @param name section name
#' @param level section level (`1` is `#`, `2` is `##`, etc.)
#'
#' @return the section header text (invisibly)
#'
#' @export
#'
#' @examples
#' # with RStudio or Positron running:
#' # grp_sect("import")
#' # grp_sect("read csv files", level = 2)
grp_sect <- function(name, level = 1) {
  if (!is.numeric(level) || length(level) != 1 || level < 1 || level %% 1 != 0) {
    cli::cli_abort("{.arg level} must be a single positive whole number.")
  }
  start <- paste0(strrep("#", level), " ", name, " ")
  header <- paste0(start, strrep("-", max(4, 80 - nchar(start))), "\n")
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
