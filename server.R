#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
#**************************************************************
# Example data set
#**************************************************************
trMatrix <- matrix(c(10,5,2,1,0,0,0,
                     5,10,5,2,1,0,0,
                     2,5,10,5,2,1,0,
                     1,2,5,10,5,2,1,
                     0,1,2,5,10,5,2,
                     0,0,1,2,5,10,5,
                     0,0,0,1,2,5,10), ncol=7)

#**************************************************************



library(shiny)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$trMatrixPlot <- renderPlotly({
    
      plot_ly(z = ~trMatrix) %>% add_surface()
    
  })
  
  output$heat <- renderPlotly({
    plot_ly(z = trMatrix, 
            type = "heatmap", source = "heatplot") %>%
      layout(xaxis = list(title = ""), 
             yaxis = list(title = ""))
  })

  
  
  
})
