# Good enough data folders

Create the data folders and a `data.md` file:

- data-raw/:

  code used to import, download and include data in your project

- data/:

  processed, intermediate, or otherwise altered data in your project

- inst/extdata/:

  external data used for examples or testing

- data.md:

  document your data here and in `R/data.R`

## Usage

``` r
ger_data(path = ".")
```

## Arguments

- path:

  path to project folder

## Value

`path` (invisibly)

## Examples

``` r
tmp <- file.path(tempdir(), "data-example")
ger_data(tmp)
#> ✔ Writing /tmp/Rtmpd22aGr/data-example/data.md
```
