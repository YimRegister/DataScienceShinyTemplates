#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#



 
library(shiny)
library(tiktokrmd)
library(sortable)



d <- read.csv("tweets.csv")
#https://medium.com/@skyetetra/how-to-make-rtweet-r-shiny-apps-with-user-credentials-48acca246b58


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$originaldata =  DT::renderDataTable({
          d

    })
    
    output$results_basic <- renderPrint({
      input$rank_list_basic # This matches the input_id of the rank list
    })

})
