## code to prepare `wu_dt` dataset goes here
require(data.table)
wu_dt <- data.table::fread(input = "https://raw.githubusercontent.com/mjfrigaard/gerp/main/inst/extdata/wu_data.csv")
usethis::use_data(wu_dt, overwrite = TRUE)


