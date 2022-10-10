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



# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  
  # Introductory Text (opening paragraph)
  output$introtext <- renderText({ res$introtext })
  
  # Learning Targets
  
  df <- data.frame(item = res$learningtargets)
  
  output$learningtarget_list <- renderUI({
    apply(df, 1, function(x) tags$li(x['item']))
  })
  output$learningtargettext <- renderText({ res$learningtargets })
  
  # greeting the user and asking them to write a learning target/goal of their own
  # this also collects the users name from the beginning and uses it in the text
  output$makeyourowngoal <- renderText({
    paste0("Hi ", input$username, "! Write down a goal of your own, however small or big it may be!")
    
  })

  #collecting the users own goal so we can remind them of it later
  usergoal <- reactive(input$mygoal)
 
  
  
  # instructions for how to label the images in DIY Label 
  output$labelinstructions <- renderText({res$labelinstructions})
  
  # rendering Problem, Data, Output text
  output$theproblem <- renderText({res$problemdataoutput[1]}) #the problem
  output$thedata <- renderText({res$problemdataoutput[2]}) # the data
  output$theoutput <- renderText({res$problemdataoutput[3]}) # the output
  
  # placeholder data for Let's Play (this simply renders the data table)
  output$originaldata  <- DT::renderDataTable(DT::datatable({
    data <- d
    if (input$type_choice != "All") {
      data <- data[data$Type == input$type_choice, ]
    }
    
    
    data <- data[data$author == input$author_select, ]
    data <- data[, c('author', 'text', 'date')]
  }, options = list(
    pageLength = 5, scrollX = T
  )))
  
  
  output$results_basic <- renderPrint({
    input$rank_list_basic # This matches the input_id of the rank list
  })
  
  
  output$secondSelection <- renderUI({
    
    #this is outputting the choices for the author once the category has been selected
    selectInput("author_select", "Author", choices = unique(as.character(d$author[d$Type ==
                                                                                    input$type_choice])))
    #returns a UI element selectable list
  })
  
  
  output$wordcloud <- renderPlot({
    tidy <- tidy_tweets %>%
      filter(author == input$author_select) %>%
      filter(!(word %in% nopes)) %>%
      anti_join(stop_words) %>%
      count(word)
    
    wordcloud(
      tidy$word,
      tidy$n,
      scale = c(4, .5),
      max.words = 70,
      
      colors = brewer.pal(8, "Dark2")
    )
  })
  
  
  
  ################ ADD IN PHOTOS FOR LABELING #######################
  output$labelit1 <- renderUI({
    tags$img(src = res$diylabel[1], style = "width:100%;")})
  
  output$labelit2 <- renderUI({
    tags$img(src = res$diylabel[2], style = "width:100%;")})
  
  output$labelit3 <- renderUI({
    tags$img(src = res$diylabel[3], style = "width:100%;")})
  

  
  
  # user orders the algorithm steps until they get them in the right order
  output$sorting_accuracy <- renderText({
   
   
    # convert to strings for easier comparison
    str1 <- paste(input$algorithm_steps_list, collapse = ",") # user input of order
    str2 <- paste(algorithm_steps, collapse = ",") # correct order from JSON
    
    
    # display if the order is incorrect or correct
      if(str1==str2){
        return(paste("<span style=\"color:green; font-size: 20px;\">Correct</span>")) # output Correct in green
        
      }else{
        return(paste("<span style=\"color:red;font-size: 20px;\">Incorrect</span>")) # output Incorrect in red
      }
    })
  
  
  ############# rendering the discussion prompts and collecting answers ####################
  output$dq1 <- renderText({res$discussionprompts[1]})
  output$dq2 <- renderText({res$discussionprompts[2]})
  output$dq3 <- renderText({res$discussionprompts[3]})
  output$dq4 <- renderText({res$discussionprompts[4]})
  
  ########### searching the news or google scholar ###########
  
  
  output$frame <- renderUI({
    
    tags$iframe(src=res$newsvideo_input, height=375, width=550)
    
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
    updateTabsetPanel(session, "menu", selected = "inthenews")
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
    updateTabsetPanel(session, "menu", selected = "inthenews")
  })
  
  observeEvent(input$back9, {
    updateTabsetPanel(session, "menu", selected = "discussion")
  })
  
  
  

 
  
})
