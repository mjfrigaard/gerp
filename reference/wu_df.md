# Wu-Tang Clan members

Example data stored as a `data.frame` (`wu_df`), `data.table` (`wu_dt`),
and `tibble` (`wu_tbl`). The raw data is in `inst/extdata/wu_data.csv`.

## Usage

``` r
wu_df

wu_dt

wu_tbl
```

## Format

A dataset with 10 rows and 5 variables:

- member:

  Wu-Tang Clan Member Name

- name:

  Wu-Tang Clan Given Name

- born:

  Birth Year

- city:

  Birth City

- alive:

  Still Alive?

An object of class `data.table` (inherits from `data.frame`) with 10
rows and 5 columns.

An object of class `spec_tbl_df` (inherits from `tbl_df`, `tbl`,
`data.frame`) with 10 rows and 5 columns.

## Source

<https://en.wikipedia.org/wiki/Wu-Tang_Clan>
