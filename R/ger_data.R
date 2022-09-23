#' good enuff data folders
#'
#' @import fs
#' @import readr
#' @export ger_data
#'
#' @description Create data folders, inst/extdata folder, and
#'     data.md file
ger_data <- function() {
  fs::dir_create("data/")
  fs::dir_create("data-raw/")
  fs::dir_create("inst/")
  fs::dir_create("inst/extdata/")
  fs::file_create("data.md")

  data_info <- "# Project Data  \n\nThere are three data folders:\n\n├── data.md\n├── data/\n├── data-raw/\n└── inst/\n     └── extdata/\n\n\n1. Put the code used to download or create raw data files in the `data-raw/` folder\n\n2. Put processed data in the `data/` folder\n\n3. Put any data used for examples or testing in `inst/extdata/`\n\nFor guidance on external data, please see: https://r-pkgs.org/data.html#sec-data-extdata\n\nMore Resources\n\n1. Sharing data: http://bit.ly/data-4-sharing\n\n2. Data in spreadsheets: http://bit.ly/data-in-sheets\n\n3. Internal data: https://r-pkgs.org/data.html"
  fs::file_create("data.md")
  readr::write_lines(x = data_info, file = "data.md", append = FALSE)
  fs::file_show("data.md")
}
