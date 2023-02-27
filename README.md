
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `gerp`: Good Enuff R Practices

<!-- badges: start -->
<!-- badges: end -->

The goal of `gerp` is to get you up and running with ‘[good enough R
practices!](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005510)’

## Installation

You can install the development version of `gerp` like so:

``` r
install.packages("remotes")
remotes::install_github("mjfrigaard/gerp")
```

## Example

Create a new `ger` project:

``` r
library(gerp)
ger::ger_proj(parent_dir = "/Users/mjfrigaard/", 
  proj_name = "my new project")
```

<img src="man/figures/gerp-new-proj.gif" width="100%" />

Run `ger::ger_setup()` and start working!

<img src="man/figures/gerp-setup.gif" width="100%" />
