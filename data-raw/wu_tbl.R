## code to prepare `wu_tbl` dataset goes here
library(tibble)
wu_tbl <- tibble::tribble(
             ~member,                     ~name, ~born,                          ~city, ~alive,
               "RZA", "Robert Fitzgerald Diggs", 1969L,                "New York City",   TRUE,
               "GZA",      "Gary Eldridge Gric", 1966L,                "New York City",   TRUE,
               "ODB",    "Russell Tyrone Jones", 1968L,                "New York City",  FALSE,
        "Method Man",     "Clifford Smith, Jr.", 1971L,       "Hempstead, Long Island",   TRUE,
           "Raekwon",             "Corey Woods", 1970L,                "New York City",   TRUE,
  "Ghostface Killah",            "Dennis Coles", 1970L, "Staten Island, New York City",   TRUE,
    "Inspectah Deck",    "Jason Richard Hunter", 1970L,                "New York City",   TRUE,
             "U-God",     "Lamont Jody Hawkins", 1970L,                "New York City",   TRUE,
       "Masta Killa",             "Jamel Irief", 1969L,                "New York City",   TRUE,
        "Cappadonna",             "Darryl Hill", 1968L,                "New York City",   TRUE
  )
usethis::use_data(wu_tbl, overwrite = TRUE)

