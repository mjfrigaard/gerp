## code to prepare `date_formats` dataset goes here
date_formats <- tolower(c("2023-01-01",
                  "2023/01/01",
                  "20230101",
                  "2023.01.01",
                  "Jan 01, 2023",
                  "January 01, 2023",
                  "February 01, 2023",
                  "March 01, 1923",
                  "May 01, 1823",
                  "June 01, 2013",
                  "July 01, 1943",
                  "01 Jan 2023",
                  "01 January 2023",
                  "01-01-2023",
                  "01/01/2023",
                  "01.01.2023"))
usethis::use_data(date_formats, overwrite = TRUE)
