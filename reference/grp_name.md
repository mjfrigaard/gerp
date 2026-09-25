# Good enough R object name

Convert a string into a `snake_case` R object name. Symbols are replaced
with abbreviations (e.g., `%` becomes `perc`), leading numbers are moved
to the end of the name, and strings without letters become `"num_var"`.

## Usage

``` r
grp_name(x, abbr = FALSE, clip = TRUE)
```

## Arguments

- x:

  character vector

- abbr:

  logical, abbreviate long names?

- clip:

  logical, copy the name to the clipboard (single names only)?

## Value

a good enough R object name (invisibly if copied to the clipboard)

## Examples

``` r
grp_name("2022-10-12-Alpha-20%", clip = FALSE)
#> [1] "alpha_20_perc_2022_10_12"
grp_name("Alpha & Beta", clip = FALSE)
#> [1] "alpha_and_beta"
```
