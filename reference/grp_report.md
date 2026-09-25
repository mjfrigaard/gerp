# Good enough R report folder

Create a `report/` folder with `report/manuscript.Rmd` (a more polished
R Markdown file for reports or manuscripts).

## Usage

``` r
grp_report(path = ".")
```

## Arguments

- path:

  path to project folder

## Value

`path` (invisibly)

## Examples

``` r
tmp <- file.path(tempdir(), "report-example")
grp_report(tmp)
#> ✔ Writing /tmp/RtmpDzzcY9/report-example/report/manuscript.Rmd
```
