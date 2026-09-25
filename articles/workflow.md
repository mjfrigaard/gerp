# Naming workflow

``` r

library(gerp)
library(tibble)
library(readr)
```

## Naming workflow

[`grp_path()`](https://mjfrigaard.github.io/gerp/reference/grp_path.md),
[`grp_fname()`](https://mjfrigaard.github.io/gerp/reference/grp_fname.md),
and
[`grp_name()`](https://mjfrigaard.github.io/gerp/reference/grp_name.md)
all work as a team to 1) create reliable names for files and objects,
and 2) make it easier to maintain the connection between project files
and object names.

### Example 1

[`grp_name()`](https://mjfrigaard.github.io/gerp/reference/grp_name.md)
works well for file names that have been located with
[`grp_path()`](https://mjfrigaard.github.io/gerp/reference/grp_path.md)
and created with
[`grp_fname()`](https://mjfrigaard.github.io/gerp/reference/grp_fname.md).

Assume I have a file named `99$bad%FILE%nAme.xlsx` in my `inst/extdata`
folder. I can create a new `bad_file_name.R` script in the `data-raw/`
folder:

``` r

file.create("data-raw/bad_file_name.R")
```

    [1] TRUE

The follow contents are placed in `bad_file_name.R`

``` r

# get absolute path
abs_pth <- gerp::grp_path("inst/extdata/99%bad%%FILE%name.csv")
# get relative path for file name
gerp::grp_path("inst/extdata/99%bad%%FILE%name.csv", type = 'rel') |> gerp::grp_fname()
```

    ✔ '2023-04-10_99-bad-file-name.csv' is copied to the clipboard!

``` r

# paste and store file name
exprt_nm <- "2023-04-10_99-bad-file-name.csv"
# get object name 
"2023-04-10_99-bad-file-name.csv" |> gerp::grp_name()
```

    ✔ 'bad_file_name_csv_2023_04_10_99' is copied to the clipboard!

``` r

# paste and import using absolute path
library(readr)
bad_file_name_csv_2023_04_10_99 <- readr::read_csv(file = abs_pth)
# export to new location using file name
readr::write_csv(x = bad_file_name_csv_2023_04_10_99, file = paste0("data-raw/", exprt_nm))
grp_path("data", tree = TRUE)
```

    /Users/mjfrigaard/projects/my_project/data-raw
    └── 2023-04-10_99-bad-file-name.csv

### Example 2

In the event I’ve created an object in R and need to export it, the
workflow is slightly different.

Assume I’ve created `new_data`, which I want to store in the `data/`
folder:

``` r

new_data <- tibble::tribble(
   ~x,                 ~y,    ~z,
  "J",   3.78788225133507, FALSE,
  "N",   6.79125214331172,  TRUE,
  "T",   3.70527803343078,  TRUE,
  "A",   5.43565140930839,  TRUE,
  "Y",   8.13565077574797, FALSE,
  "M",   6.10749813415254, FALSE,
  "G",    8.2922407776683,  TRUE,
  "B",   2.78855879559163, FALSE,
  "X",   4.36696377700339, FALSE,
  "O",   2.34682208415642,  TRUE
  )
new_data
#> # A tibble: 10 × 3
#>    x         y z    
#>    <chr> <dbl> <lgl>
#>  1 J      3.79 FALSE
#>  2 N      6.79 TRUE 
#>  3 T      3.71 TRUE 
#>  4 A      5.44 TRUE 
#>  5 Y      8.14 FALSE
#>  6 M      6.11 FALSE
#>  7 G      8.29 TRUE 
#>  8 B      2.79 FALSE
#>  9 X      4.37 FALSE
#> 10 O      2.35 TRUE
```

``` r

# store name
exrt_nm <- gerp::grp_fname("new_data")
```

    ✔ '2023-04-10_new-data' is copied to the clipboard!

``` r

# paste to check export path
paste0("data/", "2023-04-10_new-data", ".rds")
```

    [1] "data/2023-04-10_new-data.rds"

``` r

# store 
exrt_pth <- paste0("data/", "2023-04-10_new-data", ".rds")
```

``` r

# export
readr::write_rds(x = new_data, file = exrt_pth)
grp_path("data", tree = TRUE)
```

    /Users/mjfrigaard/projects/my_project/data
    └── 2023-04-10_new-data.rds
