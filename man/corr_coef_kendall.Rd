% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/corr_coef_kendall.R
\name{corr_coef_kendall}
\alias{corr_coef_kendall}
\title{corr_coef_kendall
correlation Coeficient using kendall Method}
\usage{
corr_coef_kendall(variable1 = NULL, variable2 = NULL, decimal = NULL)
}
\arguments{
\item{variable1}{is a column or Numeric vector}

\item{variable2}{is a column or Numeric vector}

\item{decimal}{is a Numeric Argument}
}
\value{
correlation coeficient
}
\description{
corr_coef_kendall
correlation Coeficient using kendall Method
}
\examples{
corr_coef_kendall(variable1= mtcars$cyl, variable2=mtcars$carb, decimal = 2)
}
