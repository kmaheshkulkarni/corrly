#============================================================ Partial Autocorrelation ====================================================================


#' pacf_ly
#' Partial Auto Correlation Plot using R Plotly
#' @param series is numeric vector
#' @import plotly
#' @importFrom stats acf pacf qnorm
#' @return plot
#' @export
#' @examples
#' series<- c(mtcars$mpg, mtcars$hp)
#' pacf_ly(series)
pacf_ly <- function(series) {
  significance_level <- qnorm((1 + 0.95)/2)/sqrt(sum(!is.na(series)))
  p_acf <-pacf(series, plot=F)
  df_pacf <- with(p_acf, data.frame(lag, acf))
  pacf_plotly <- plotly::plot_ly(df_pacf, x = ~lag, y = ~acf, color = ~acf, type = "bar", showlegend = FALSE, mode='markers', name = "LAG, ACF") %>%
    plotly::add_markers(y = significance_level, marker=list(colorbar=list(title='Correlation Coeficient')), name = "Positive Significance Level") %>%
    plotly::add_markers(y = -significance_level, marker=list(colorbar=list(title='Correlation Coeficient')), name = "Negative Significance Level") %>%
    plotly::layout(xaxis = list( title = 'LAG'), yaxis = list( title = 'PACF')) %>%
    plotly::add_lines(y = significance_level,
              line = list(color = 'rgb(22, 96, 167)'),
              name = "Positive Significance Level", showlegend = TRUE) %>%
    plotly::add_lines(y = -significance_level, line = list(color = '#07A4B5'),
              name = "Negative Significance Level", showlegend = TRUE) %>%
    plotly::config(displaylogo = FALSE, collaborate = FALSE);
  pacf_plotly <- pacf_plotly %>% plotly::colorbar(title="Correlation Coeficient")
  pacf_plotly
  return(pacf_plotly);
}
