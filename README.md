<div align="center">
 
[![](/man/figures/logo.png)](https://kmaheshkulkarni.github.io/corrly/)

# Corrly is a Data Visualization Package For Manufacturing Process.

<!-- badges: start -->
[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
<!-- badges: end -->

- [Home page](https://github.com/kmaheshkulkarni/corrly/index.html)

## Install Corrly

``` r
# install.packages("devtools")
# devtools::install_github("kmaheshKulkarni/corrly")
```

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
