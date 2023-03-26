#  user_path_prep -----
#' @noRd
#' @importFrom fs path_expand
user_path_prep <- function(path) {
  ## usethis uses fs's notion of home directory
  ## this ensures we are consistent about that
  fs::path_expand(path)
}

# is_quiet ----
#' @noRd
is_quiet <- function() {
  isTRUE(getOption("usethis.quiet", default = FALSE))
}

# indent -----
#' @noRd
indent <- function(x, first = "  ", indent = first) {
  x <- gsub("\n", paste0("\n", indent), x)
  paste0(first, x)
}

# check_path_is_directory -------------
#' @noRd
#'
#' @importFrom fs file_exists is_link is_dir
#' @importFrom glue glue
check_path_is_directory <- function(path) {
  if (!fs::file_exists(path)) {
    ui_stop("Directory {ui_path(path)} does not exist.")
  }
  if (fs::is_link(path)) {
    path <- link_path(path)
  }
  if (!fs::is_dir(path)) {
    ui_stop("{ui_path(path)} is not a directory.")
  }
}

# create_directory ----------
#' @noRd
#'
#' @importFrom fs dir_exists file_exists dir_create
create_directory <- function(path) {
  if (fs::dir_exists(path)) {
    return(
      invisible(FALSE)
      )
  } else if (fs::file_exists(path)) {
    ui_stop("{ui_path(path)} exists but is not a directory.")
  }
  fs::dir_create(path, recurse = TRUE)
  ui_done("Creating {ui_path(path)}")
  invisible(TRUE)
}
