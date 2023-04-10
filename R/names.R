#' And (`&`) to abbreviation (`'and'`)
#'
#' @param x string
#'
#' @keywords internal
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
#' @keywords internal
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
#'
#' @keywords internal
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
#'
#' @keywords internal
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
#'
#' @keywords internal
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

#' Check if name has file extension
#'
#' @param x character string
#'
#' @keywords internal
#'
#' @return logical (`TRUE` = has file extension, `FALSE` = no file extension)
#'
#' @examples
#' check_file_extensions("file name with extension.ext")
#' check_file_extensions("long file name without extension")
check_file_extensions <- function(x) {
  ifelse(grepl(pattern = "\\.[a-zA-Z0-9]+", x = x),
    yes = TRUE, no = FALSE)
}

#' Period (`.`) to abbreviation (`'dot'`)
#'
#' @param x string
#'
#'
#' @keywords internal
#'
#' @return abbreviated period symbols
#'
period2abbr <- function(x) {
  if (!check_file_extensions(x)) {
    # clear white space
    symb <- gsub("[[:space:]]| |\\s", "", x = x)
    if (grepl(pattern = "(\\.)+", x = symb)) {
      sub(pattern = "(\\.)+", "dot_", x = symb)
    } else {
      x
    }
  } else {
    x
  }
}

#' Caret (hat) (`^`) to abbreviation (`'hat'`)
#'
#' @param x string
#'
#'
#' @keywords internal
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
#'
#' @keywords internal
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
#'
#' @keywords internal
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
#'
#' @keywords internal
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
#'
#' @keywords internal
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
#'
#' @keywords internal
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
#' @keywords internal
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
#' @keywords internal
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
#' @keywords internal
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

#' Covert symbols to strings
#'
#' @param x string
#'
#' @keywords internal
#'
#' @return selected converted symbols
#'
convert_symbols <- function(x) {
  # remove white space
  posix_ws <- gsub("[[:space:]]", "_", x)
  # remove raw white space
  raw_ws <- gsub(" ", "_", posix_ws)
  # replace symbols with abbreviations
  no_symbols <- symb2abbr(raw_ws)
  # remove starting or trailing punctuation
  no_outer_punc <- gsub("^[[:punct:]]*|[[:punct:]]*$", "", no_symbols)
  # replace double underscores with single
  converted_symbols <- gsub("__", "_", no_outer_punc)
  return(converted_symbols)
}


#' Check R object name is a character string
#'
#' @param x string
#'
#' @keywords internal
#'
#' @return character input
#'
check_chr <- function(x) {
  # is the remaining string a number?
  if (isFALSE(is.na(suppressWarnings(as.numeric(x))))) {
    chr_input <- "num_var"
  } else {
    chr_input <- x
  }
  return(chr_input)
}


#' Check R object name for numeric prefix
#'
#' @param x string
#'
#' @keywords internal
#'
#' @return character string with numeric values moved to end
#'
check_num_prefix <- function(input) {
  # move starting numbers to end
  if (grepl(x = input, pattern = "^\\d", ignore.case = TRUE)) {
    # extract preceding numbers or special characters from string
    bad_prefix <- gsub("[a-zA-Z].*", "\\1", input)
    # remove num_prefix
    chrs <- sub(bad_prefix,"\\1", input)
    # reverse order
    start_nm <- paste0(chrs, "_", bad_prefix)
  } else {
    start_nm <- input
  }
  # replace remaining punctuation with underscores
  no_punct <- gsub("[[:punct:]]", "_", start_nm)
  # replace all double underscores with single underscores
  no_dbl_snakes <- gsub("__", "_", no_punct)
  # lowercase
  no_num_prefix <- tolower(no_dbl_snakes)
  return(no_num_prefix)
}


#' Good enough name
#'
#' @param x string
#' @param abbr logical, abbreviate? (default is `FALSE`)
#'
#' @return A good enough R object name
#'
#' @importFrom crayon green
#' @importFrom clipr write_clip
#' @importFrom cli cli_alert_success
#' @importFrom glue glue_collapse
#'
#' @export ger_name
#'
#' @examples
#' # ger_name("2022-10-12-Alpha-20%")
#' # ger_name("Alpha & Beta")
ger_name <- function(x, abbr = FALSE) {

  converted_symbols <- convert_symbols(x = x)

  chr_input <- check_chr(x = converted_symbols)

  no_num_prefix <- check_num_prefix(input = chr_input)

  # attempt to abbreviate long names
  if (isTRUE(abbr)) {
    short_name <- abbreviate(names.arg = no_num_prefix,
                    method = "both",
                    strict = FALSE,
                    minlength = 18)
  } else {
    short_name <- no_num_prefix
  }
  # remove any trailing underscores
  ger_name <- gsub("[_]*$", "", short_name)
  # pretty printing
  ger_encode <- encodeString(ger_name, quote = "'")
  ger_green <- crayon::green(ger_encode)
  clipr::write_clip(content = ger_name, allow_non_interactive = TRUE)
  cli::cli_alert_success(text =
      glue::glue_collapse("{ger_green} is copied to the clipboard!"))
}


#' Good enough file name
#'
#' @param x string
#'
#' @return good enough file name
#'
#' @importFrom stringr word fixed
#' @importFrom tools file_path_sans_ext file_ext
#' @importFrom purrr map_vec
#' @importFrom crayon green
#' @importFrom clipr write_clip
#' @importFrom cli cli_alert_success
#' @importFrom glue glue_collapse
#'
#' @export ger_fname
#'
#' @examples
#' # ger_fname(x = "November profits (monday)-Carl's copy")
#' # ger_fname(x = "%file & with @_gArbage NAME.txt")
ger_fname <- function(x) {
    # create date string
    tday <- as.character(Sys.Date())
    # create date prefix
    tday_prefix <- paste0(tday, "_")
    file_nm_pth <- tools::file_path_sans_ext(x)
    extsn <- tools::file_ext(x)
    if (nchar(extsn) > 0) {
      file_extsn <- paste0(".", extsn)
    } else {
      file_extsn <- NULL
    }
    file_nm_extsn <- base::basename(x)
    # lowercase
    nm_lower <- tolower(file_nm_pth)
    # remove single apostrophe
    nm_no_apostrophe <- gsub("'", "", nm_lower)
    # replace punctuation with space
    no_punct <- gsub("[[:punct:]]", " ", nm_no_apostrophe)
    # extract words
    nm_wrds <- stringr::word(no_punct, start = 1L, end = 1:nchar(no_punct),
                sep = stringr::fixed(' '))
    # get longest set of words
    long_nm <- max(purrr::map_vec(nm_wrds, nchar), na.rm = TRUE)
    longest_nm <- nm_wrds[nchar(nm_wrds) == long_nm][1]
    # remove extra whitespace
    single_ws <- gsub("\\s+", "-", longest_nm)
    # replace whitespace with hyphens
    hyphens_no_ws <- gsub("[[:space:]]| ", "-", single_ws)
    # replace double hyphens with single
    no_dbl_hyphens <- gsub("--", "-", hyphens_no_ws)
    # remove any trailing hyphens
    no_trailing_hyphens <- gsub("-$", "", no_dbl_hyphens)
    # remove any prefix hyphens
    no_prefix_hyphens <- gsub("^-", "", no_trailing_hyphens)
    ger_fname <- paste0(tday_prefix, no_prefix_hyphens, file_extsn)
    ger_encode <- encodeString(ger_fname, quote = "'")
    ger_green <- crayon::green(ger_encode)
      clipr::write_clip(content = ger_fname, allow_non_interactive = TRUE)
      cli::cli_alert_success(text =
          glue::glue_collapse("{ger_green} is copied to the clipboard!"))
}


check_date_prefix <- function(x) {

}
