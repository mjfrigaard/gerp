#' Write a gerp template to a project
#'
#' @param template file name in `inst/templates/`
#' @param dest destination file path
#' @param data named list of values replacing `{{name}}` in the template
#'
#' @return `TRUE` (invisibly) if written, `FALSE` if `dest` already exists
#'
#' @noRd
use_ger_template <- function(template, dest, data = list()) {
  if (fs::file_exists(dest)) {
    cli::cli_alert_info("Skipping {.path {dest}} (already exists)")
    return(invisible(FALSE))
  }
  src <- system.file("templates", template, package = "gerp", mustWork = TRUE)
  txt <- readLines(src, warn = FALSE, encoding = "UTF-8")
  for (nm in names(data)) {
    txt <- gsub(paste0("{{", nm, "}}"), data[[nm]], txt, fixed = TRUE)
  }
  fs::dir_create(fs::path_dir(dest))
  writeLines(txt, dest, useBytes = TRUE)
  cli::cli_alert_success("Writing {.path {dest}}")
  invisible(TRUE)
}

#' Ask the user a yes/no question (aborts when not interactive)
#'
#' @noRd
ger_confirm <- function(msg, .envir = parent.frame()) {
  if (!interactive()) {
    cli::cli_abort(
      c(msg, "i" = "User input required, but session is not interactive."),
      .envir = .envir
    )
  }
  cli::cli_inform(msg, .envir = .envir)
  utils::menu(c("Yes", "No")) == 1L
}

#' Call an rstudioapi function (works in RStudio and Positron)
#'
#' @return `list(value = fun(...))`, or `NULL` if no IDE is available
#'
#' @noRd
ide_call <- function(fun, ...) {
  tryCatch(list(value = fun(...)), error = function(e) NULL)
}
