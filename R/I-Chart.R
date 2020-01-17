#============================================================ X-Chart or I Chart ====================================================================


#' ichart_ly
#' I Chart or X-Chart Plot using R Plotly
#' @param data is a Data Frame
#' @param x is a column of data frame on x-axis
#' @param y is a column of data frame on y-axis
#' @param xname is a string and Name of x-axis
#' @param yname is a string and Name of y-axis
#' @param text is a string
#' @import plotly
#' @return plot
#' @export
#' @examples
#' ichart_ly(mtcars, x = mtcars$mpg, y = mtcars$hp, xname = "mpg", yname = "hp", text= "text")
ichart_ly <- function(data, x = NULL, y = NULL, xname = NULL, yname = NULL, text= NULL){
  f1 <- list(family = "Arial, sans-serif", size = 18, color = "darkgrey")
  f2 <- list(family = "Old Standard TT, serif", size = 14, color = "black")
  a <- list(title = paste0(xname), titlefont = f1, showticklabels = TRUE, tickangle = 45, tickfont = f2, exponentformat = "E")
  b <- list(title = paste0(yname), titlefont = f1, showticklabels = TRUE, tickangle = 45, tickfont = f2, exponentformat = "E")

  Mean_ichart <- mean(y)
  moving_range <- abs(diff(y))
  moving_range_mean <- mean(moving_range)
  sigma_i_mr_chart <- moving_range_mean/1.128
  ucl_i_chart <- Mean_ichart + (3 * sigma_i_mr_chart)
  lcl_i_chart <- Mean_ichart - (3 * sigma_i_mr_chart)
  data$colors <- "steelblue"
  data$symbols <- "circle"
  data$sizes <- 5
  # data$utc_date_time <- ymd_hms(data$utc_date_time)

  data$colors[y > ucl_i_chart] <- "#ff5c5c"
  data$symbols[y > ucl_i_chart] <- "circle"
  data$sizes[y > ucl_i_chart] <- 8

  data$colors[y < lcl_i_chart] <- "#ff5c5c"
  data$symbols[y < lcl_i_chart] <- "circle"
  data$sizes[y < lcl_i_chart] <- 8
  return(plotly::plot_ly(data, x = x, y = y) %>%
           plotly::add_markers(name = paste0('Pararameter value'), marker = list(color = ~I(as.character(colors)), symbol = ~I(as.character(symbols)), size = data$sizes), showlegend = FALSE) %>%
           plotly::add_trace(type = 'scatter', mode = 'lines', color = I('#01579b'), showlegend = FALSE, 
                             hovertemplate = paste('<i>yname</i>: $%{y:.2f}',
                                                   '<br><b>xname</b>: %{x}<br>',
                                                   '<b>%{text}</b>'),opacity=1) %>%
           plotly::add_trace(y=ucl_i_chart,name = "UCL",type = 'scatter', mode ='lines', line = list(dash = "dot"), color = I('#e53935'), showlegend = FALSE) %>%
           plotly::add_trace(y=(Mean_ichart + (2*sigma_i_mr_chart)),name = "+ 2 Sigma",type = 'scatter', mode = 'lines', line = list(dash = "dash"), color = I('#ffb74d'), showlegend = FALSE) %>%
           plotly::add_trace(y=(Mean_ichart + sigma_i_mr_chart),name = "+ 1 Sigma",type = 'scatter', mode = 'lines', line = list(dash = "dash"), color = I('#ffcc80'), showlegend = FALSE) %>%
           plotly::add_trace(y=Mean_ichart,name = "Average", mode ='lines',type = 'scatter', line = list(dash = "solid"), color = I('#66bb6a'), showlegend = FALSE) %>%
           plotly::add_trace(y=(Mean_ichart - sigma_i_mr_chart),name = "- 1 Sigma",type = 'scatter', mode = 'lines', line = list(dash = "dash"), color = I('#ffcc80'), showlegend = FALSE) %>%
           plotly::add_trace(y=(Mean_ichart - (2*sigma_i_mr_chart)),name = "- 2 Sigma",type = 'scatter', mode = 'lines', line = list(dash = "dash"), color = I('#ffb74d'), showlegend = FALSE) %>%
           plotly::add_trace(y=lcl_i_chart,name = "LCL",type = 'scatter', mode ='lines', line = list(dash = "dot"), color = I('#e53935'), showlegend = FALSE) %>%
           plotly::layout(xaxis = a, title = paste0(), yaxis = b) %>%
           plotly::layout(legend = list(orientation = "h",   # show entries horizontally
                                xanchor = "bottom",  # use center of legend as anchor
                                x = "middle", y = -0.3,
                                bordercolor = "#333",
                                borderwidth = 2))%>%
           plotly::config(displaylogo = FALSE))
}
