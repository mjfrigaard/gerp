# Insert an R script section header

Insert a section header at the cursor in RStudio or Positron (similar to
`Cmd/Ctrl + Shift + R`). Use `level` to nest sections in the document
outline.

## Usage

``` r
grp_sect(name, level = 1)
```

## Arguments

- name:

  section name

- level:

  section level (`1` is `#`, `2` is `##`, etc.)

## Value

the section header text (invisibly)

## Examples

``` r
# with RStudio or Positron running:
# grp_sect("import")
# grp_sect("read csv files", level = 2)
```
