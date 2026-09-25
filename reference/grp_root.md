# Get the root folder of your project

Find the project root by looking upwards for an `.Rproj` file, an R
package `DESCRIPTION`, a `.git` folder, or a `.here` file (so it works
in both RStudio and Positron).

## Usage

``` r
grp_root(path = ".", tree = FALSE)
```

## Arguments

- path:

  path to start searching from

- tree:

  logical, print a folder tree?

## Value

root path (invisibly if `tree = TRUE`)

## Examples

``` r
# grp_root()
# grp_root(tree = TRUE)
```
