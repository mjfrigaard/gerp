# Look up a file or folder in your project

Search the project (from
[`grp_root()`](https://mjfrigaard.github.io/gerp/reference/grp_root.md))
for files or folders named `x` and print a folder tree for each match.

## Usage

``` r
grp_lkp_path(x, path = grp_root())
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
# grp_lkp_path("README.Rmd")
# grp_lkp_path("inst")
```
