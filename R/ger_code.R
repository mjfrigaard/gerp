#' @title  good enuff code files
#'
#' @import fs
#' @import readr
#' @import purrr
#' @import collateral
#' @export ger_code
#'
#' @param folder_name name of folder for code files (string)
#' @param header include roxygen2 headers?
#'
#' @description Create the code folder for the import, tidy, wrangle, visualize,
#'     model, and data .R files.
#' @details If header is FALSE, code files are created with a standard script
#'    header. By default, the code files are placed in a code/ folder, but this
#'    can be changed with a character string.
ger_code <- function(folder_name = NULL, header = TRUE) {
  if (is.null(folder_name)) {
    code_dir <- paste0("code", "/")
  } else {
    code_dir <- paste0(folder_name, "/")
  }
  # create dir
  fs::dir_create(path = code_dir)
  code_files <- c(
    "import.R",
    "tidy.R",
    "wrangle.R",
    "visualize.R",
    "model.R"
  )
  # create code file paths
  code_file_paths <- suppressMessages(
    suppressWarnings(
      purrr::map2_chr(
        .x = code_dir,
        .y = code_files,
        .f = paste0
      )
    )
  )
  # create files
  suppressMessages(
    suppressWarnings(
      collateral::map_safely(
        .x = code_file_paths,
        .f = fs::file_create
      )
    )
  )

  if (isTRUE(header)) {
    code_header <- c("#' @title \n#' \n#' @import \n#' \n#' @description\n#' \n#' @details\n#' \n#' @examples \n#' \n#'")
    suppressMessages(
      suppressWarnings(
        collateral::map2_safely(
          .x = code_header,
          .y = code_file_paths,
          .f = readr::write_lines,
          append = TRUE
        )
      )
    )
  } else {
    code_header <- c("#=====================================================================#\n# This is code to create:\n# Authored by and feedback to:\n# MIT License\n# Version:\n#=====================================================================#\n")
    suppressMessages(
      suppressWarnings(
        collateral::map2_safely(
          .x = code_header,
          .y = code_file_paths,
          .f = readr::write_lines,
          append = TRUE
        )
      )
    )
  }
  # data file
  data_file_path <- paste0(code_dir, "data.R")
  fs::file_create(data_file_path)
  data_example <- "#' Title (dataset description)\n#'\n#' @format A dataset with variables:\n#' \\describe{\n#'   \\item{member}{Wu-Tang Clan Member Name}\n#'   \\item{name}{Wu-Tang Clan Given Name}\n#'   \\item{born}{Birth Year}\n#'   \\item{city}{Birth City}\n#'   \\item{alive}{Stil Alive?}\n#' }\n#' @source Link to data: https://en.wikipedia.org/wiki/Wu-Tang_Clan\n#' (downloaded YYYY-MM-DD)\n'wu_data'"
  readr::write_lines(
    x = data_example,
    file = data_file_path,
    append = TRUE)
}
