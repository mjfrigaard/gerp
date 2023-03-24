#' good enough data folders
#'
#' @importFrom fs dir_create
#' @importFrom fs file_create
#' @importFrom fs file_show
#' @importFrom readr write_lines
#' @export ger_data
#'
#' @param show_file open data.md file?
#'
#' @description Create data folders, inst/extdata folder, and
#'     data.md file
#' @details ger_data() will create the following files and folders:
#' \describe{
#'   \item{data-raw/}{should contain any code used to import, download and include data in your project}
#'   \item{data/}{should contain processed, intermediate, or otherwise altered data in your project}
#'   \item{inst/exdata/}{should have any external data used for examples or testing}
#'   \item{data.md}{Document your data here and in code/data.R}
#' }
#' @examples
#' # in new project
#' # ger_data(show_file = FALSE)
ger_data <- function(show_file = TRUE) {
  fs::dir_create("data/")
  fs::dir_create("data-raw/")
  fs::dir_create("inst/")
  fs::dir_create("inst/extdata/")
  fs::file_create("data.md")

  data_info <- c("# Project Data  \n\nHow to use the data folders:\n\n├── data.md\n├── data/\n├── data-raw/\n└── inst/\n     └── extdata/\n\n\n1. Put the code used to download or create raw data files in the `data-raw/` folder\n\n2. Put processed data in the `data/` folder\n\n3. Put any data used for examples or testing in `inst/extdata/`","\n4. Document your data in `code/data.R`", "\n\nFor guidance on external data, please see: https://r-pkgs.org/data.html#sec-data-extdata\n\nMore Resources\n\n1. Sharing data: http://bit.ly/data-4-sharing\n\n2. Data in spreadsheets: http://bit.ly/data-in-sheets\n\n3. Internal data: https://r-pkgs.org/data.html")
  fs::file_create("data.md")
  readr::write_lines(x = data_info, file = "data.md", append = FALSE)
  if (show_file == TRUE) {
    fs::file_show("data.md")
  }
}
