#' good enough data folders
#'
#' @importFrom fs file_show file_create dir_create
#' @importFrom readr write_lines
#' @export ger_data
#'
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
#' # ger_data()
ger_data <- function(folder_name = NULL) {
data_info <- c("# Project Data

How to use the data folders:

├── data.md
├── data/
├── data-raw/
└── inst/
     └── extdata/


1. Put the R code used to download, prepare, and create data in data-raw/

2. Put data for examples in the data/ folder (stored as .rda files)

3. Put non-R-specific data files used for examples or testing in inst/extdata/

4. Document your data in code/data.R

For guidance on external data, please see:

  - https://r-pkgs.org/data.html#sec-data-extdata

To see an example, check out the data vigentte:

  - https://mjfrigaard.github.io/gerp/articles/data.html

More Resources

  1. Sharing data: http://bit.ly/data-4-sharing

  2. Data in spreadsheets: http://bit.ly/data-in-sheets

  3. Internal data: https://r-pkgs.org/data.html")

  if (!is.null(folder_name)) {

    fs::dir_create(paste0(folder_name, "/", "data/"))
    fs::dir_create(paste0(folder_name, "/","data-raw/"))
    fs::dir_create(paste0(folder_name, "/","inst/"))
    fs::dir_create(paste0(folder_name, "/","inst/extdata/"))
    fs::file_create(paste0(folder_name, "/", "data.md"))
    readr::write_lines(x = data_info, na = character(),
      file = paste0(folder_name, "/", "data.md"),
      append = FALSE)

  } else {

    fs::dir_create("data/")
    fs::dir_create("data-raw/")
    fs::dir_create("inst/")
    fs::dir_create("inst/extdata/")
    fs::file_create("data.md")
    readr::write_lines(x = data_info, file = "data.md", append = FALSE)

  }
}
