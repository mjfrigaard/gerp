# Look up a file or folder in your project

Search the project (from
[`ger_root()`](https://mjfrigaard.github.io/gerp/reference/ger_root.md))
for files or folders named `x` and print a folder tree for each match.

## Usage

``` r
ger_lkp_path(x, path = ger_root())
```

## Arguments

- x:

  file or folder name to search for (e.g., `"README.Rmd"`)

- path:

  path to search (defaults to the project root)

## Value

matching path(s) (invisibly)

## Examples

``` r
# ger_lkp_path("README.Rmd")
# ger_lkp_path("inst")
```
