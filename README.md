
# <a href='https://maheshkulkarnix.github.io/corrlY/'><img src="logo.png" align="right" alt="" width="250" /></a>

### Corrly is a Data Visualization Package For Manufacturing Process.

## Install Corrly

``` r
library(plotly)
library(htmltools)
library(corrly)
install.packages("devtools")
devtools::install_github("maheshKulkarniX/corrlY")
```
## Correlation Scatter Plot

``` r
spearman<- corr_coef_spearman(variable1= cars$speed, variable2=cars$dist, decimal = 2)
corr_scatterly(data=cars,x=cars$speed,y=cars$dist,corr_coef=spearman,xname="speed",yname="dist")
```

## Correlation Matrix Plot

``` r
matrixly(data = mtcars)
```