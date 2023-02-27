## code to prepare `wu_df` dataset goes here
wu_df <- utils::read.csv("https://raw.githubusercontent.com/mjfrigaard/gerp/main/inst/extdata/wu_data.csv")
usethis::use_data(wu_df, overwrite = TRUE)
