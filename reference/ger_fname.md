# Good enough file name

Convert a string into a lowercase, hyphenated file name with a date
prefix (`YYYY-MM-DD_`). File extensions are kept.

## Usage

``` r
ger_fname(x, date = Sys.Date(), clip = TRUE)
```

## Arguments

- x:

  character vector of file names

- date:

  date prefix (`NULL` for no prefix)

- clip:

  logical, copy the name to the clipboard (single names only)?

## Value

a good enough file name (invisibly if copied to the clipboard)

## Examples

``` r
ger_fname("November profits (monday)-Carl's copy", clip = FALSE)
#> [1] "2026-09-25_november-profits-monday-carls-copy"
ger_fname("%file & with @_gArbage NAME.txt", date = NULL, clip = FALSE)
#> [1] "file-with-garbage-name.txt"
```
