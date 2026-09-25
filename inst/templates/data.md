# Project Data

How to use the data folders:

```
├── data.md
├── data/
├── data-raw/
└── inst/
     └── extdata/
```

1. Put the R code used to download, prepare, and create data in `data-raw/`
2. Put data for examples in the `data/` folder (stored as `.rda` files)
3. Put non-R-specific data files used for examples or testing in `inst/extdata/`
4. Document your data in `R/data.R`

For guidance on external data, please see:

  - https://r-pkgs.org/data.html#sec-data-extdata

To see an example, check out the data vignette:

  - https://mjfrigaard.github.io/gerp/articles/data.html

More resources:

  1. Sharing data: http://bit.ly/data-4-sharing
  2. Data in spreadsheets: http://bit.ly/data-in-sheets
  3. Internal data: https://r-pkgs.org/data.html
