
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `geR2`: Good Enuff R (version 2!)

<!-- badges: start -->
<!-- badges: end -->

The goal of `geR2` is to get you up and running with ‘[good enough
practices!](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005510)’

## Installation

You can install the development version of `geR2` like so:

``` r
install.packages("remotes")
remotes::install_github("mjfrigaard/ger2")
```

## Example

Create a new `ger2` project:

``` r
library(geR2)
ger2::ger_proj(parent_dir = "/Users/mjfrigaard/", 
  proj_name = "my new project")
```

<img src="man/figures/ger2-new-proj.gif" width="100%" />

Run `ger2::ger_setup()` and start working!

<img src="man/figures/ger2-setup.gif" width="100%" />
