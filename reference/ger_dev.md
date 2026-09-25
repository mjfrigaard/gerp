# Good enough R development folder

Create a `dev/` folder with `dev/notebook.Rmd` (a running lab notebook).

## Usage

``` r
ger_dev(path = ".")
```

## Arguments

- path:

  path to project folder

## Value

`path` (invisibly)

## Examples

``` r
tmp <- file.path(tempdir(), "dev-example")
ger_dev(tmp)
#> ✔ Writing /tmp/Rtmpd22aGr/dev-example/dev/notebook.Rmd
```
