#' Symbols and their abbreviations (used by `ger_name()`)
#'
#' @noRd
symbol_abbrs <- c(
  "~" = "tilde", "!" = "bang", "@" = "at", "#" = "num", "$" = "dollar",
  "%" = "perc", "^" = "hat", "&" = "and", "*" = "ast", "\u2014" = "emdash",
  "=" = "equals", "+" = "plus"
)

#' Replace symbols with abbreviations (runs of a symbol count once)
#'
#' @noRd
symb2abbr <- function(x) {
  for (s in names(symbol_abbrs)) {
    rgx <- paste0("(", gsub("([][{}()+*^$|\\\\?.])", "\\\\\\1", s), ")+")
    x <- gsub(rgx, paste0(" ", symbol_abbrs[[s]], " "), x)
  }
  x
}

#' Move leading numbers to the end of an object name
#'
#' @noRd
move_num_prefix <- function(x) {
  words <- strsplit(x, "_", fixed = TRUE)[[1]]
  is_num <- grepl("^[0-9]+$", words)
  if (all(is_num)) {
    return("num_var")
  }
  n_lead <- which(!is_num)[1] - 1
  if (n_lead == 0) {
    return(x)
  }
  paste(c(words[-seq_len(n_lead)], words[seq_len(n_lead)]), collapse = "_")
}

#' Clean a file name stem (lowercase words separated by hyphens)
#'
#' @noRd
clean_stem <- function(x) {
  x <- tolower(gsub("'", "", x, fixed = TRUE))
  x <- gsub("[^a-z0-9]+", "-", x)
  gsub("^-+|-+$", "", x)
}

#' Copy a result to the clipboard (when possible)
#'
#' @noRd
copy_result <- function(x, clip) {
  if (isTRUE(clip) && length(x) == 1 && clipr::clipr_available()) {
    clipr::write_clip(x, allow_non_interactive = TRUE)
    cli::cli_alert_success("{.val {x}} is copied to the clipboard!")
    return(invisible(x))
  }
  x
}

#' Good enough R object name
#'
#' @description
#' Convert a string into a `snake_case` R object name. Symbols are replaced
#' with abbreviations (e.g., `%` becomes `perc`), leading numbers are moved
#' to the end of the name, and strings without letters become `"num_var"`.
#'
#' @param x character vector
#' @param abbr logical, abbreviate long names?
#' @param clip logical, copy the name to the clipboard (single names only)?
#'
#' @return a good enough R object name (invisibly if copied to the clipboard)
#'
#' @export
#'
#' @examples
#' ger_name("2022-10-12-Alpha-20%", clip = FALSE)
#' ger_name("Alpha & Beta", clip = FALSE)
ger_name <- function(x, abbr = FALSE, clip = TRUE) {
  nm <- tolower(symb2abbr(x))
  nm <- gsub("[^a-z0-9]+", "_", nm)
  nm <- gsub("^_+|_+$", "", nm)
  nm <- vapply(nm, move_num_prefix, character(1), USE.NAMES = FALSE)
  if (isTRUE(abbr)) {
    nm <- unname(abbreviate(nm, minlength = 18, method = "both", strict = FALSE))
    nm <- gsub("_+$", "", nm)
  }
  copy_result(nm, clip)
}

#' Good enough file name
#'
#' @description
#' Convert a string into a lowercase, hyphenated file name with a date
#' prefix (`YYYY-MM-DD_`). File extensions are kept.
#'
#' @param x character vector of file names
#' @param date date prefix (`NULL` for no prefix)
#' @param clip logical, copy the name to the clipboard (single names only)?
#'
#' @return a good enough file name (invisibly if copied to the clipboard)
#'
#' @export
#'
#' @examples
#' ger_fname("November profits (monday)-Carl's copy", clip = FALSE)
#' ger_fname("%file & with @_gArbage NAME.txt", date = NULL, clip = FALSE)
ger_fname <- function(x, date = Sys.Date(), clip = TRUE) {
  ext <- tools::file_ext(x)
  ext <- ifelse(nzchar(ext), paste0(".", ext), "")
  prefix <- if (is.null(date)) "" else paste0(format(as.Date(date)), "_")
  nm <- paste0(prefix, clean_stem(tools::file_path_sans_ext(basename(x))), ext)
  copy_result(nm, clip)
}
