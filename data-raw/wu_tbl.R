## code to prepare `wu_tbl` dataset goes here
require(readr)
wu_tbl <- readr::read_csv("https://raw.githubusercontent.com/mjfrigaard/gerp/main/inst/extdata/wu_data.csv")
usethis::use_data(wu_tbl, overwrite = TRUE)
