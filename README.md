
<!-- README.md is generated from README.Rmd. Please edit that file -->

# corrly <a href='https://kmaheshkulkarni.github.io/corrly/'><img src="logo.png" align="right" alt="" width="250" /></a>

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
<!-- badges: end -->

### Corrly is a Data Visualization Package For Manufacturing Process.

## Install Corrly

``` r
# install.packages("devtools")
# devtools::install_github("kmaheshKulkarni/corrly")
```

The package tests the use of htmlwidgets in pkgdown:

  - [Home page](https://github.com/kmaheshkulkarni/corrly/index.html)
    (i.e., `README.Rmd` or `index.Rmd`)
  - [Reference
    topics](https://jayhesselberth.github.io/widgetdown/reference/test-widgets.html)
    using Rd `@examples`.


## Correlation Scatter Plot

``` r
library(plotly)
library(corrly)
spearman<- corr_coef_spearman(variable1= cars$speed, variable2=cars$dist, decimal = 2)
corr_scatterly(data=cars,x=cars$speed,y=cars$dist,corr_coef=spearman,xname="speed",yname="dist")
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />

## Correlation Matrix Plot

``` r
library(plotly)
library(corrly)
matrixly(data = mtcars)
```

<img src="man/figures/README-unnamed-chunk-7-1.png" width="100%" />
