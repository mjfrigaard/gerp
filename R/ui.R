# ui_value -----
#' @noRd
#'
#' @importFrom crayon blue
#' @importFrom glue glue_collapse
ui_value <- function(x) {
  if (is.character(x)) {
    x <- encodeString(x, quote = "'")
  }
  x <- crayon::blue(x)
  x <- glue::glue_collapse(x, sep = ", ")
  x
}

# ui_inform -----
#' @noRd
#'
#' @importFrom rlang inform
#'
ui_inform <- function(...) {
  if (!is_quiet()) {
    rlang::inform(paste0(...))
  }
  invisible()
}


# ui_stop -----
#' @noRd
#'
#' @importFrom glue glue_collapse glue
ui_stop <- function(x, .envir = parent.frame()) {
  x <- glue::glue_collapse(x, "\n")
  x <- glue::glue(x, .envir = .envir)

  cnd <- structure(
    class = c("usethis_error", "error", "condition"),
    list(message = x)
  )
  stop(cnd)
}


# ui_yeah -----
#' @noRd
#'
#' @importFrom glue glue_collapse glue
#' @importFrom rlang is_interactive inform
#' @importFrom utils menu
ui_yeah <- function(x,
      yes = c("Yes", "Definitely", "For sure", "Yup", "Yeah", "I agree", "Absolutely"),
      no = c("No way", "Not now", "Negative", "No", "Nope", "Absolutely not"),
      n_yes = 1, n_no = 2, shuffle = TRUE,
      .envir = parent.frame()) {
  x <- glue::glue_collapse(x, "\n")
  x <- glue::glue(x, .envir = .envir)

  if (!rlang::is_interactive()) {
    ui_stop(c(
      "User input required, but session is not interactive.",
      "Query: {x}"
    ))
  }

  n_yes <- min(n_yes, length(yes))
  n_no <- min(n_no, length(no))

  qs <- c(sample(yes, n_yes), sample(no, n_no))

  if (shuffle) {
    qs <- sample(qs)
  }

  # TODO: should this be ui_inform()?
  rlang::inform(x)
  out <- utils::menu(qs)
  out != 0L && qs[[out]] %in% yes
}


## ui_nope -----
#' @noRd
#'
ui_nope <- function(x,
      yes = c("Yes", "Definitely", "For sure", "Yup", "Yeah", "I agree", "Absolutely"),
      no = c("No way", "Not now", "Negative", "No", "Nope", "Absolutely not"),
      n_yes = 1, n_no = 2, shuffle = TRUE,
      .envir = parent.frame()) {
  # TODO(jennybc): is this correct in the case of no selection / cancelling?
  !ui_yeah(
    x = x, yes = yes, no = no,
    n_yes = n_yes, n_no = n_no,
    shuffle = shuffle,
    .envir = .envir
  )
}


# ui_line -----
#' @noRd
#'
#' @importFrom glue glue_collapse glue
#'
ui_line <- function(x = character(), .envir = parent.frame()) {
  x <- glue::glue_collapse(x, "\n")
  x <- glue::glue(x, .envir = .envir)
  ui_inform(x)
}


# ui_path -----
#' @noRd
#'
#' @importFrom fs is_dir path_rel path_tidy
#'
ui_path <- function(x, base = NULL) {
  is_directory <- fs::is_dir(x) | grepl("/$", x)
  if (is.null(base)) {
    x <- proj_rel_path(x)
  } else if (!identical(base, NA)) {
    x <- fs::path_rel(x, base)
  }
  # rationalize trailing slashes
  x <- fs::path_tidy(x)
  x <- ifelse(is_directory, paste0(x, "/"), x)
  ui_value(x)
}

# ui_bullet -----
#' @noRd
#'
#' @importFrom cli symbol
ui_bullet <- function(x, bullet = cli::symbol$bullet) {
  bullet <- paste0(bullet, " ")
  x <- indent(x, bullet, "  ")
  ui_inform(x)
}


# ui_todo -----
#' @noRd
#'
#' @importFrom glue glue_collapse glue
#' @importFrom crayon red
#' @importFrom cli symbol
ui_todo <- function(x, .envir = parent.frame()) {
  x <- glue::glue_collapse(x, "\n")
  x <- glue::glue(x, .envir = .envir)
  ui_bullet(x, crayon::red(cli::symbol$bullet))
}

# ui_code -----
#' @noRd
#'
#' @importFrom crayon silver
#' @importFrom glue glue_collapse
ui_code <- function(x) {
  x <- encodeString(x, quote = "`")
  x <- crayon::silver(x)
  x <- glue::glue_collapse(x, sep = ", ")
  x
}

# ui_done -----
#' @noRd
#'
#' @importFrom glue glue_collapse glue
#' @importFrom crayon green
#' @importFrom cli symbol
ui_done <- function(x, .envir = parent.frame()) {
  x <- glue::glue_collapse(x, "\n")
  x <- glue::glue(x, .envir = .envir)
  ui_bullet(x, crayon::green(cli::symbol$tick))
}
