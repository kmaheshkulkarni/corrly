#============================================================ Autocorrelation ====================================================================


#' acf_ly
#' Auto Correlation Plot using R Plotly
#' @param series is numeric vector
#' @import plotly
#' @importFrom stats acf qnorm
#' @return plot
#' @export
#' @examples
#' series<- c(mtcars$mpg, mtcars$hp)
#' acf_ly(series)
acf_ly <- function(series) {
  significance_level <- qnorm((1 + 0.95)/2)/sqrt(sum(!is.na(series)))
  a_cf <-acf(series, plot=F)
  df_acf <-with(a_cf, data.frame(lag, acf))
  acf_plotly<- plotly::plot_ly(df_acf, x = ~lag, y = ~acf, color = ~acf, type = "bar", showlegend = FALSE, mode='markers', name = "LAG, ACF") %>%
    plotly::add_markers(y = significance_level, marker=list(colorbar=list(title='Correlation Coeficient')), name = "Positive Significance Level") %>%
    plotly::add_markers(y = -significance_level, marker=list(colorbar=list(title='Correlation Coeficient')), name = "Negative Significance Level") %>%
    plotly::layout(xaxis = list( title = 'LAG'), yaxis = list( title = 'ACF')) %>%
    plotly::add_lines(y = significance_level,
              line = list(color = 'rgb(22, 96, 167)'),
              name = "Positive Significance Level", showlegend = TRUE) %>%
    plotly::add_lines(y = -significance_level,
              line = list(color = '#07A4B5'),
              name = "Negative Significance Level", showlegend = TRUE) %>%
    plotly::config(displaylogo = FALSE, collaborate = FALSE);
  acf_plotly <- acf_plotly %>% plotly::colorbar(title="Correlation Coeficient")
  acf_plotly
  return(acf_plotly)
}
