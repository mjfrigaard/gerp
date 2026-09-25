# Good enough code files

Create the `R/` folder with `import.R`, `tidy.R`, `wrangle.R`,
`visualize.R`, `model.R`, and `data.R` files. Existing files are not
overwritten.

## Usage

``` r
ger_code(path = ".", roxygen = TRUE)
```

## Arguments

- path:

  path to project folder

- roxygen:

  logical, use a roxygen2 header (`TRUE`) or a standard script header
  (`FALSE`)?

## Value

`path` (invisibly)

## Examples

``` r
tmp <- file.path(tempdir(), "code-example")
ger_code(tmp)
#> ✔ Writing /tmp/Rtmpd22aGr/code-example/R/import.R
#> ✔ Writing /tmp/Rtmpd22aGr/code-example/R/tidy.R
#> ✔ Writing /tmp/Rtmpd22aGr/code-example/R/wrangle.R
#> ✔ Writing /tmp/Rtmpd22aGr/code-example/R/visualize.R
#> ✔ Writing /tmp/Rtmpd22aGr/code-example/R/model.R
#> ✔ Writing /tmp/Rtmpd22aGr/code-example/R/data.R
```
