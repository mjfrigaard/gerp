#' Percents (`%`) to abbreviation (`'perc'`)
#'
#' @param x string
#'
#' @return abbreviated percent symbols
#'
perc2abbr <- function(x) {
  if (grepl(pattern = "(\\%)+", x = x)) {
    sub(pattern = "(\\%)+", "perc_", x = x)
  } else {
    x
  }
}

#' At (`@`) to abbreviation (`'at'`)
#'
#' @param x string
#'
#' @return abbreviated at symbols
#'
at2abbr <- function(x) {
  if (grepl(pattern = "(\\@)+", x = x)) {
    sub(pattern = "(\\@)+", "at_", x = x)
  } else {
    x
  }
}

#' And (`&`) to abbreviation (`'and'`)
#'
#' @param x string
#'
#' @return abbreviated and symbols
#'
and2abbr <- function(x) {
  if (grepl(pattern = "(\\&)+", x = x)) {
    sub(pattern = "(\\&)+", "and_", x = x)
  } else {
    x
  }
}

#' Pluses (`+`) to abbreviation (`'plus'`)
#'
#' @param x string
#'
#' @return abbreviated plus symbols
#'
plus2abbr <- function(x) {
  if (grepl(pattern = "(\\+)+", x = x)) {
    sub(pattern = "(\\+)+", "plus_", x = x)
  } else {
    x
  }
}

#' Bang (`!`) to abbreviation (`'bang'`)
#'
#' @param x string
#'
#' @return abbreviated bang symbols
#'
bang2abbr <- function(x) {
  if (grepl(pattern = "(\\!)+", x = x)) {
    sub(pattern = "(\\!)+", "bang_", x = x)
  } else {
    x
  }
}

#' Symbol to abbreviations
#'
#' @param input string
#'
#' @return abbreviated symbols
#'
symb2abbr <- function(input) {
  percs <- perc2abbr(x = input)
  ats <- at2abbr(x = percs)
  ands <- and2abbr(x = ats)
  snakes <- plus2abbr(x = ands)
  bangs <- bang2abbr(snakes)
  # remove any trailing underscores
  abbrevs <- gsub("_$", "", bangs)
  return(abbrevs)
}

#' Good enough name
#'
#' @param x string
#'
#' @return good enough name (for an R object)
#' @export ger_name
#'
#' @examples
#' ger_name("2022-10-12-Alpha-20%")
#' ger_name("Alpha & Beta")
ger_name <- function(x) {
  input <- symb2abbr(x)
  # replace symbols with abbreviations
  if (grepl(x = input, pattern = "^\\d", ignore.case = TRUE)) {
    # extract preceding numbers or special characters from string
    bad_prefix <- gsub("[a-zA-Z].*", "\\1", input)
    # remove num_prefix
    chrs <- sub(bad_prefix,"\\1", input)
    # reverse order
    start_nm <- paste0(chrs, "_", bad_prefix)
    # combine with
  } else {
    start_nm <- input
  }
  # replace all punctuation with underscores
  snakes <- gsub("[[:punct:]]", "_", start_nm)
  # remove any trailing underscores
  no_trailing_snakes <- gsub("_$", "", snakes)
  # replace all whitespace with underscores
  white_snakes <- gsub(" ", "_", no_trailing_snakes)
  # replace all double underscores with underscores
  single_snakes <- gsub("__", "_", white_snakes)
  # replace all double underscores with underscores
  no_trailing_dbl_snakes <- gsub("__$", "", single_snakes)
  # remove all single trailing underscores
  no_trailing_single_snakes <- gsub("_$", "", no_trailing_dbl_snakes)
  # lowercase
  ger_name <- tolower(no_trailing_single_snakes)
  return(ger_name)
}

