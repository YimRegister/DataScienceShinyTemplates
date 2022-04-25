#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(emo)
library(shinyLP)
library(tiktokrmd)
library(sortable)
labels <- list(
  "one",
  "two",
  "three",
  "four",
  "five"
)

labels_shuffled <- sample(labels)

rank_list_basic <- rank_list(
  text = "Drag the steps into the right order",
  labels = labels_shuffled,
  input_id = "rank_list_basic"
)
# Define shiny UI
shinyUI(fluidPage(theme = "bootstrap.css",
  
  # begin the navbar
  navbarPage(emo::ji("rainbow"),
             
             # INTRODUCTION
             tabPanel(p("Intro"),
                      
                      column(6, align="center", offset = 3,
                      # Page title
                      titlePanel("Introduction"),
                      h1(emo::ji("computer")),
                      p("_______________"),
                      
                      # Behavior
                    
                       wellPanel(
                        p("This lesson explores...")),
                        img(src="computer.jpeg", align="center"),
                      br(),
                      br(),
                      textInput("name", "What's your name?"),
                      br(),
                      actionButton(inputId = "back", label = "Back", style="color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-right:200px"),
                      
                      actionButton(inputId = "next", label = "Next",style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
                      ),
                      #end of tabpanel 
                        
                      
             ),
             
             
             
             # LEARNING GOALS FOR THIS LESSON
             tabPanel(p("Learning Goals"),
                      fluidRow(
                      column(6, align="center", offset = 3,
                      # Page title
                      
                      titlePanel("Learning Goals"),
                      h1(emo::ji("target")),
                      p("_______________"),
                    
                        
                      # Behavior
                      wellPanel(
                      p("By the end of the lesson, you'll know more about:"),
                      tags$ul(align="left",
                        tags$li("First list item"), 
                        tags$li("Second list item"), 
                        tags$li("Third list item")
                      ),
                      p("_______________"),
                      textInput("mygoal", "Another learning goal of my own", "make something cool..."),
                      ))),
                      
                      fluidRow(align="center",
                      
                      actionButton(inputId = "back", label = "Back", style="color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-right:200px"),
                      actionButton(inputId = "next", label = "Next",style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
                      ),
            
                          
                          
                        
            #end of tabpanel 
            ),
            
            # THE PROBLEM, THE DATA, THE GOAL
            tabPanel(p("1-2-3"),
                     fluidRow(
                     column(4, align="center", offset = 4,
                            # Page title
                            titlePanel("The Problem, The Data, The Output"),
                            h1(emo::ji("triangular_flag")),
                            p("_______________"),
                            
                     )),
                     
                     fluidRow(
                       column(4, wellPanel(p("Column width 4"))),
                       column(4, wellPanel(p("Column width 4"))),
                       column(4, wellPanel(p("Column width 4")))),
                     
                     fluidRow(align="center",
                      
                     actionButton(inputId = "back", label = "Back", style="color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-right:200px"),
                     
                     actionButton(inputId = "next", label = "Next",style="color: #fff; background-color: #337ab7; border-color: #2e6da4"),
                     )
            
                             
                     #end of tabpanel 
            ),
            
            # LABEL SOME DATA
            tabPanel(p("DIY Labeling"),
                     fluidRow(
                     column(4, align="center", offset = 4,
                            # Page title
                            titlePanel("Label it yourself"),
                            h1(emo::ji("memo")),
                            p("Is it positive, negative, or neutral?"),
                            p("_______________"),
                           
                            
                            
                            # Behavior
                           
                     ), 
                     ),
                     fluidRow(
                       column(3, wellPanel(
                         p("Column width 3"),
                        
                         img(src="pic1.png", style="width:150px;"),
                         textInput(label="Label", inputId = "label1"),
                         
                         
                       )
                      ),
                      
                      column(3, wellPanel(
                        p("Column width 3"),
                        
                        img(src="pic2.png", style="width:150px;"),
                        textInput(label="Label", inputId = "label1"),
                        
                        
                      )
                      ),
                      
                      column(3, wellPanel(
                        
                        p("Column width 3"),
                        
                        img(src="pic3.png", style="width:150px;"),
                        textInput(label="Label", inputId = "label1"),
                        
                        
                      )
                      ),
                      
                      column(3, wellPanel(
                        p("Column width 3"),
                        
                        img(src="pic4.png", style="width:150px;"),
                        textInput(label="Label", inputId = "label1"),
                        
                        
                      )
                      ),
                      
                      
                       
                     
                     ),
                    
                     
                     fluidRow(align="center",
                              
                              actionButton(inputId = "back", label = "Back", style="color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-right:200px"),
                              actionButton(inputId = "next", label = "Next",style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
                     ),
                     
                     
                     #end of tabpanel 
            ),
            
            
            
            # ALGORITHM STEPS (HIGH LEVEL) # what if the student could fill this in themselves? or drag and drop order the steps?????remotes::install_github("rstudio/sortable")
            tabPanel("Algorithm",
                     
                     
               column(width=8,align="center", offset=2,
                  
                  h2("How does the algorithm work?"),
                  h1(emo::ji("shuffle")),
                  p("_______________"),
                  rank_list_basic,
                  tags$b("Result"),
                  verbatimTextOutput("results_basic"),
                  br(),
                  
                  fluidRow(align="center",
                           
                           actionButton(inputId = "back", label = "Back", style="color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-right:200px"),
                           actionButton(inputId = "next", label = "Next",style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
                  )
               )
                
              
              
              
              
              
              
              
            #end of tabpanel  
            ),
            
            # INTERACTIVE DASHBOARD
            tabPanel("Let's Play",
                     column(width=8,align="center", offset=2,
                     h2("Interactive Dashbord"),
                     h1(emo::ji("magnifying")),
                     p("_______________"),
                     
                     
                    
                       
                       DT::dataTableOutput("originaldata"),
                       
                       fluidRow(align="center",
                                
                                actionButton(inputId = "back", label = "Back", style="color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-right:200px"),
                                actionButton(inputId = "next", label = "Next",style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
                       ),
                       
                       
                       
                       
                     ),
                     
            ),
            
            # RELEVANT EXAMPLE
            tabPanel('In the News',
                     
                     column(width=8,align="center", offset=2,
                            h2("In the News"),
                            h1(emo::ji("newspaper")),
                            p("_______________"),
                     
                     
                     fluidRow(align="center",
                              
                              actionButton(inputId = "back", label = "Back", style="color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-right:200px"),
                              actionButton(inputId = "next", label = "Next",style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
                     ),    
                     )
            ),
            
            # CRITICAL DISCUSSION PROMPTS
            tabPanel('What do you think?',
                     column(width=8,align="center", offset=2,
                            h2("Discussion Prompts"),
                            h1(emo::ji("light_bulb")),
                            p("_______________"),
                     fluidRow(align="center",
                              
                              actionButton(inputId = "back", label = "Back", style="color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-right:200px"),
                              actionButton(inputId = "next", label = "Next",style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
                     ), 
                     
                     ),
            ),
            
            
            
            tabPanel("Gallery",
                     
                     column(width=8,align="center", offset=2,
                            h2("Tik Tok Time"),
                            h1(emo::ji("mobile_phone")),
                            p("_______________"),
                     ),
                     
                     sidebarPanel(
                       p("Upload yours"),
                       fileInput("file1", "Upload", accept = ".csv"),
                     
                       
                       
                       
                     ),
                     fluidPage(
                       column(6,
                       tiktok_html("https://www.tiktok.com/@computing.simplified/video/6989722588050230534?is_from_webapp=1&sender_device=pc")
                       ),
                       column(6,
                              tiktok_html("https://www.tiktok.com/@computing.simplified/video/6989045577883389190?is_from_webapp=1&sender_device=pc&web_id=7088017589272462891")
                       ),
                       column(6,
                              tiktok_html("https://www.tiktok.com/@computing.simplified/video/6989279020575739142?is_from_webapp=1&sender_device=pc&web_id=7088017589272462891")
                       )
                     )
            
            ),
    
  )
))
