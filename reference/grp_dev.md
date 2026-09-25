# Good enough R development folder

Create a `dev/` folder with `dev/notebook.Rmd` (a running lab notebook).

## Usage

``` r
grp_dev(path = ".")
```

## Arguments

- path:

  path to project folder

## Value

`path` (invisibly)

## Examples

``` r
tmp <- file.path(tempdir(), "dev-example")
grp_dev(tmp)
#> ✔ Writing /tmp/RtmpDzzcY9/dev-example/dev/notebook.Rmd
```
