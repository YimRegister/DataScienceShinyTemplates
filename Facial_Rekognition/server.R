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
  output$originaldata =  DT::renderDataTable({
    d})
  
  
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
  
  
  base64 <- reactive({
    inFile <- input[["upload"]]
    if(!is.null(inFile)){
      dataURI(file = inFile$datapath, mime = "image/png")
    }
  })
  
  output[["image"]] <- renderUI({
    if(!is.null(base64())){
      tags$div(
        tags$img(src= base64(), width="100%"),
        style = "width: 400px;"
      )
    }
    else{
      tags$p("Image will appear here")
    }
  })
  
  
  
  
  
  
  make_details <- eventReactive(input$analyze_button, {
    
    aws_secret_access_key = ""
    Sys.setenv(AWS_ACCESS_KEY_ID = "", AWS_SECRET_ACCESS_KEY ="", AWS_REGION = "")
    svc <- rekognition()
    #svc$index_faces(CollectionId="photos-r", Image=list(Bytes=inFile$datapath), ExternalImageId=imgName, DetectionAttributes=list())
    photo = input[["upload"]]$datapath
    # Read the photo using magick
    img = image_read(photo)
    details<- svc$detect_faces(Image=list(Bytes=photo), Attributes="ALL")
    
    
    
  })
  
  output$age_detected <- renderPrint({
    make_details()$FaceDetails[[1]]$Age
    
    
  })
  
  output$eyesopen_detected <- renderPrint({
    make_details()$FaceDetails[[1]]$EyesOpen
    
    
  })
  
  
  output$gender_detected <- renderPrint({
    make_details()$FaceDetails[[1]]$Gender
    
    
  })
  output$emotion_plot <- renderPlotly({
    library(ggplot2)
    emotions <- make_details()$FaceDetails[[1]]$Emotions
    emotions_data <- as.data.frame(do.call(rbind, emotions))
    
    emotions_data<- data.frame(unlist(emotions_data$Type), unlist(emotions_data$Confidence))
    colnames(emotions_data) <- c("Type", "Confidence")
    
    plt <- ggplot(data=emotions_data, aes(x=Type, y=Confidence, fill=Type)) +
      geom_bar(stat="identity")+
      ggtitle("Emotions Detected in Image")+
      theme_bw()+
      theme(legend.position = "none")+
      theme(axis.text.x = element_text(angle = 30, vjust = 0.5, hjust=1))
      
    plt
    
  }
  
  
  )
  output$emotions <- renderPrint({
    
    runif(input$analyze_button)
    make_details()$FaceDetails[[1]]$Emotions
    
    
    
    
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
