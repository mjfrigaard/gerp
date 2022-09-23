## code to prepare `wu_df` dataset goes here
require(readr)
wu_df <- readr::read_csv("inst/extdata/wu_df.csv")
usethis::use_data(wu_df, overwrite = TRUE)
