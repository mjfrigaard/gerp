# Good enough code files

Create the `R/` folder with `import.R`, `tidy.R`, `wrangle.R`,
`visualize.R`, `model.R`, and `data.R` files. Existing files are not
overwritten.

## Usage

``` r
grp_code(path = ".", roxygen = TRUE)
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
grp_code(tmp)
#> ✔ Writing /tmp/RtmpDzzcY9/code-example/R/import.R
#> ✔ Writing /tmp/RtmpDzzcY9/code-example/R/tidy.R
#> ✔ Writing /tmp/RtmpDzzcY9/code-example/R/wrangle.R
#> ✔ Writing /tmp/RtmpDzzcY9/code-example/R/visualize.R
#> ✔ Writing /tmp/RtmpDzzcY9/code-example/R/model.R
#> ✔ Writing /tmp/RtmpDzzcY9/code-example/R/data.R
```
