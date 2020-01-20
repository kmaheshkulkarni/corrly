#' normal_distribution
#' normal distribution Chart using R Plotly
#' @param data is a Data Frame
#' @param parameter is a column of data frame 
#' @param xname is title of xaxis
#' @param title is plot name
#' @import plotly
#' @importFrom stats sd dnorm
#' @importFrom graphics hist
#' @return plot
#' @export
#' @examples
#' normal_distribution(data = mtcars, parameter = mtcars$mpg, xname = "mpg", title = "Plot Name")
normal_distribution <- function(data = NULL, parameter = NULL, xname = "", title = NULL){
  parameter <- as.numeric(parameter)
  mean_overall <- mean(parameter)
  sigma_overall <- sd(parameter)
  t <- list(family = "sans serif", size = 20, color = '#333')
  # par(mar=c(1,1,1,1))
  histo <- hist(parameter, breaks = 10, plot = FALSE) 
  xfit <- seq(min(parameter), max(parameter)) 
  yfit <- dnorm(xfit, mean = mean(parameter), sd = sd(parameter)) 
  yfit <- yfit * diff(histo$mids[1:2]) * length(parameter) 
  limit_data <- data.frame(xvalues = c((mean_overall - (3*sigma_overall)),
                                       (mean_overall - (2*sigma_overall)),
                                       (mean_overall - sigma_overall),
                                       (mean_overall),
                                       (mean_overall + sigma_overall),
                                       (mean_overall + (2*sigma_overall)),
                                       (mean_overall + (3*sigma_overall))),
                           yvalues = c(max(yfit), max(yfit), max(yfit), max(yfit), max(yfit), max(yfit), max(yfit)),
                           textvalues = c('-3 Sigma', '-2 Sigma', '-1 Sigma', 'Mean', '+1 Sigma', '+2 Sigma', '+3 Sigma'))
  return(
    plot_ly(x = xfit, y = yfit)%>%
      add_trace(name = 'Distribution',type = 'scatter', mode='lines', color = I('#01579b'), showlegend = FALSE)%>%
      add_trace(x=(mean_overall - (3*sigma_overall)),type = 'scatter', mode = 'lines', line = list(dash = "dash"), color = I('#ffb74d'), name='-2 sigma', showlegend = FALSE)%>%
      add_trace(x=(mean_overall - (2*sigma_overall)),type = 'scatter', mode = 'lines', line = list(dash = "dash"), color = I('#ffb74d'), name='-2 sigma', showlegend = FALSE)%>%
      add_trace(x=(mean_overall - sigma_overall),type = 'scatter', mode = 'lines', line = list(dash = "dash"), color = I('#ffcc80'), name='-1 sigma', showlegend = FALSE)%>%
      add_trace(x=mean_overall,type = 'scatter', mode = 'lines', line = list(dash = "dash"), color = I('#66bb6a'), name='Mean', showlegend = FALSE)%>%
      add_trace(x=(mean_overall + sigma_overall),type = 'scatter', mode = 'lines', line = list(dash = "dash"), color = I('#ffcc80'), name='+1 sigma', showlegend = FALSE)%>%
      add_trace(x=(mean_overall + (2*sigma_overall)),type = 'scatter', mode = 'lines', line = list(dash = "dash"), color = I('#ffb74d'), name='+2 sigma', showlegend = FALSE)%>%
      add_trace(x=(mean_overall + (3*sigma_overall)),type = 'scatter', mode = 'lines', line = list(dash = "dash"), color = I('#ffb74d'), name='+2 sigma', showlegend = FALSE)%>%
      layout(title= paste0(title), font=t, xaxis = list(title = paste0(xname)),yaxis = list (title = "Frequency"))%>%
      add_annotations(x = limit_data$xvalues, y = limit_data$yvalues, text = limit_data$textvalues, xref = "x", yref = "y", showarrow = TRUE, arrowhead = 4, arrowsize = 0.5, ax = 10, ay = -25, opacity = 0.7)%>%
      plotly::config(displaylogo = FALSE)
  )
}
