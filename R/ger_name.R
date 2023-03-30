#' And (`&`) to abbreviation (`'and'`)
#'
#' @param x string
#'
#' @noRd
#'
#'
#'
#' @return abbreviated and symbols
#'
and2abbr <- function(x) {
  symb <- gsub("[[:space:]]| |\\s", "", x = x)
  if (grepl(pattern = "(\\&)+", x = symb)) {
    sub(pattern = "(\\&)+", "and_", x = symb)
  } else {
    x
  }
}

#' At (`@`) to abbreviation (`'at'`)
#'
#' @param x string
#'
#' @noRd
#'
#'
#'
#' @return abbreviated at symbols
#'
at2abbr <- function(x) {
  symb <- gsub("[[:space:]]| |\\s", "", x = x)
  if (grepl(pattern = "(\\@)+", x = symb)) {
    sub(pattern = "(\\@)+", "at_", x = symb)
  } else {
    x
  }
}

#' Asterisk (`*`) to abbreviation (`'ast'`)
#'
#' @param x string
#'
#' @noRd
#'
#'
#'
#' @return abbreviated asterisk symbols
#'
asterisk2abbr <- function(x) {
  symb <- gsub("[[:space:]]| |\\s", "", x = x)
  if (grepl(pattern = "(\\*)+", x = symb)) {
    sub(pattern = "(\\*)+", "ast_", x = symb)
  } else {
    x
  }
}

#' Exclamation (`!`) to abbreviation (`'bang'`)
#'
#' @param x string
#'
#' @noRd
#'
#'
#'
#' @return abbreviated exclamation symbols
#'
exclamation2abbr <- function(x) {
  symb <- gsub("[[:space:]]| |\\s", "", x = x)
  if (grepl(pattern = "(\\!)+", x = symb)) {
    sub(pattern = "(\\!)+", "bang_", x = symb)
  } else {
    x
  }
}

#' Dollar (`$`) to abbreviation (`'dollar'`)
#'
#' @param x string
#'
#' @noRd
#'
#'
#'
#' @return abbreviated dollar sign symbols
#'
dollar2abbr <- function(x) {
  symb <- gsub("[[:space:]]| |\\s", "", x = x)
  if (grepl(pattern = "(\\$)+", x = symb)) {
    sub(pattern = "(\\$)+", "dollar_", x = symb)
  } else {
    x
  }
}

#' Period (`.`) to abbreviation (`'dot'`)
#'
#' @param x string
#'
#' @noRd
#'
#'
#'
#' @return abbreviated period symbols
#'
period2abbr <- function(x) {
  symb <- gsub("[[:space:]]| |\\s", "", x = x)
  if (grepl(pattern = "(\\.)+", x = symb)) {
    sub(pattern = "(\\.)+", "dot_", x = symb)
  } else {
    x
  }
}

#' Caret (hat) (`^`) to abbreviation (`'hat'`)
#'
#' @param x string
#'
#' @noRd
#'
#'
#'
#' @return abbreviated caret symbols
#'
caret2abbr <- function(x) {
  symb <- gsub("[[:space:]]| |\\s", "", x = x)
  if (grepl(pattern = "(\\^)+", x = symb)) {
    sub(pattern = "(\\^)+", "hat_", x = symb)
  } else {
    x
  }
}



#' Em dash (`—`) to abbreviation (`'emdash'`)
#'
#' @param x string
#'
#' @noRd
#'
#'
#'
#' @return abbreviated em dash symbols
#'
emdash2abbr <- function(x) {
  symb <- gsub("[[:space:]]| |\\s", "", x = x)
  if (grepl(pattern = "(\\—)+", x = symb)) {
    sub(pattern = "(\\—)+", "emdash_", x = symb)
  } else {
    x
  }
}

#' Equals (`=`) to abbreviation (`'equals'`)
#'
#' @param x string
#'
#' @noRd
#'
#'
#'
#' @return abbreviated equals symbols
#'
equal2abbr <- function(x) {
  symb <- gsub("[[:space:]]| |\\s", "", x = x)
  if (grepl(pattern = "(\\=)+", x = symb)) {
    sub(pattern = "(\\=)+", "equals_", x = symb)
  } else {
    x
  }
}

#' Hyphen (`-`) to abbreviation (`'hyphen'`)
#'
#' @param x string
#'
#' @noRd
#'
#'
#'
#' @return abbreviated hyphen symbols
#'
hyphen2abbr <- function(x) {
  symb <- gsub("[[:space:]]| |\\s", "", x = x)
  if (grepl(pattern = "(\\-)+", x = symb)) {
    sub(pattern = "(\\-)+", "hyphen_", x = symb)
  } else {
    x
  }
}

#' Percents (`%`) to abbreviation (`'perc'`)
#'
#' @param x string
#'
#' @noRd
#'
#'
#'
#' @return abbreviated percent symbols
#'
percents2abbr <- function(x) {
  symb <- gsub("[[:space:]]| |\\s", "", x = x)
  if (grepl(pattern = "(\\%)+", x = symb)) {
    sub(pattern = "(\\%)+", "perc_", x = symb)
  } else {
    x
  }
}

#' Pluses (`+`) to abbreviation (`'plus'`)
#'
#' @param x string
#'
#' @noRd
#'
#'
#'
#' @return abbreviated plus symbols
#'
plus2abbr <- function(x) {
  symb <- gsub("[[:space:]]| |\\s", "", x = x)
  if (grepl(pattern = "(\\+)+", x = symb)) {
    sub(pattern = "(\\+)+", "plus_", x = symb)
  } else {
    x
  }
}

#' Number symbol (`#`) to abbreviation (`'num'`)
#'
#' @param x string
#'
#' @noRd
#'
#'
#'
#' @return abbreviated plus symbols
#'
num2abbr <- function(x) {
  symb <- gsub("[[:space:]]| |\\s", "", x = x)
  if (grepl(pattern = "(\\#)+", x = symb)) {
    sub(pattern = "(\\#)+", "num_", x = symb)
  } else {
    x
  }
}

#' Tilde symbol (`#`) to abbreviation (`'tilde'`)
#'
#' @param x string
#'
#' @noRd
#'
#'
#'
#' @return abbreviated tilde symbols
#'
tilde2abbr <- function(x) {
  symb <- gsub("[[:space:]]| |\\s", "", x = x)
  if (grepl(pattern = "(\\~)+", x = symb)) {
    sub(pattern = "(\\~)+", "tilde_", x = symb)
  } else {
    x
  }
}

#' Symbol to abbreviations
#'
#' @param input string
#'
#' @noRd
#'
#' @return abbreviated symbols
#'
symb2abbr <- function(input) {
  ands <- and2abbr(x = input)
  asterisks <- asterisk2abbr(ands)
  ats <- at2abbr(x = asterisks)
  carets <- caret2abbr(x = ats)
  dollars <- dollar2abbr(carets)
  emdashes <- emdash2abbr(x = dollars)
  equals <- equal2abbr(x = emdashes)
  bangs <- exclamation2abbr(equals)
  nums <- num2abbr(x = bangs)
  percs <- percents2abbr(x = nums)
  periods <- period2abbr(x = percs)
  pluses <- plus2abbr(x = periods)
  snakes <- tilde2abbr(x = pluses)
  # remove white space
  posix_ws <- gsub("[[:space:]]", "", snakes)
  # remove raw white space
  raw_ws <- gsub(" ", "", posix_ws)
  # remove any trailing underscores
  abbrs <- gsub("_$", "", raw_ws)
  return(abbrs)
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
  # remove white space
  posix_ws <- gsub("[[:space:]]", "_", x)
  # remove raw white space
  raw_ws <- gsub(" ", "_", posix_ws)
  # replace symbols with abbreviations
  input <- symb2abbr(raw_ws)
  # move starting numbers to end
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
  # replace remaining punctuation with underscores
  no_punct <- gsub("[[:punct:]]", "_", start_nm)
  # remove any trailing underscores
  no_trailing_snakes <- gsub("_$", "", no_punct)
  # replace all double underscores with single underscores
  no_dbl_snakes <- gsub("__", "_", no_trailing_snakes)
  # remove any trailing double underscores
  no_trailing_dbl_snakes <- gsub("__$", "", no_dbl_snakes)
  # lowercase
  ger_name <- tolower(no_trailing_dbl_snakes)
  # pretty printing
  ger_encode <- encodeString(ger_name, quote = "'")
  ger_blue <- crayon::green(ger_encode)
  ger_name_out <- glue::glue_collapse(ger_blue, sep = ", ")
  return(ger_name_out)
}

