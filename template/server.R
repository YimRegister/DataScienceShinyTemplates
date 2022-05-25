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



d <- iris
#https://medium.com/@skyetetra/how-to-make-rtweet-r-shiny-apps-with-user-credentials-48acca246b58
library(jsonlite)
res <- fromJSON("input.json")


# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  output$originaldata =  DT::renderDataTable({
    d
    
  })
  
  output$introtext <- renderText({ res$introtext })
  
  output$learningtargettext <- renderText({ res$learningtargets })
  
  output$results_basic <- renderPrint({
    input$rank_list_basic # This matches the input_id of the rank list
  })
  
  
  
  
  
  ####### CONTROLLING BACK AND NEXT BEHAVIOR #############
  
  
  ####### all the next buttons ######
  observeEvent(input$next1, {
    updateTabsetPanel(session, "menu", selected = "learningtargets")
  })
  
  observeEvent(input$next2, {
    updateTabsetPanel(session, "menu", selected = "problemdataoutput")
  })
  
  observeEvent(input$next3, {
    updateTabsetPanel(session, "menu", selected = "diylabel")
  })
  
  observeEvent(input$next4, {
    updateTabsetPanel(session, "menu", selected = "algorithmsteps")
  })
  
  observeEvent(input$next5, {
    updateTabsetPanel(session, "menu", selected = "interactivedashboard")
  })
  
  observeEvent(input$next6, {
    updateTabsetPanel(session, "menu", selected = "example")
  })
  
  observeEvent(input$next7, {
    updateTabsetPanel(session, "menu", selected = "discussion")
  })
  
  observeEvent(input$next8, {
    updateTabsetPanel(session, "menu", selected = "tiktok")
  })
  
  
  ######## all the back buttons #######
  
  
  observeEvent(input$back2, {
    updateTabsetPanel(session, "menu", selected = "intro")
  })
  
  observeEvent(input$back3, {
    updateTabsetPanel(session, "menu", selected = "learningtargets")
  })
  
  observeEvent(input$back4, {
    updateTabsetPanel(session, "menu", selected = "problemdataoutput")
  })
  
  observeEvent(input$back5, {
    updateTabsetPanel(session, "menu", selected = "diylabel")
  })
  
  observeEvent(input$back6, {
    updateTabsetPanel(session, "menu", selected = "algorithmsteps")
  })
  
  observeEvent(input$back7, {
    updateTabsetPanel(session, "menu", selected = "interactivedashboard")
  })
  
  observeEvent(input$back8, {
    updateTabsetPanel(session, "menu", selected = "example")
  })
  
  observeEvent(input$back9, {
    updateTabsetPanel(session, "menu", selected = "discussion")
  })
  
  
  

 
  
})
