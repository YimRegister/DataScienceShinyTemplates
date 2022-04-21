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

# Define shiny UI
shinyUI(fluidPage(theme = "bootstrap.css",
  
  # begin the navbar
  navbarPage(icon("rainbow"),
             
             tabPanel(p("Intro"),
                      
                      column(6, align="center", offset = 3,
                      # Page title
                      titlePanel("Template Introduction"),
                      h2(emo::ji("coder")),
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
             
             
             
             
             tabPanel(p("Learning Goals"),
                      fluidRow(
                      column(6, align="center", offset = 3,
                      # Page title
                      titlePanel("Learning Goals"),
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
            
            tabPanel(p("1-2-3"),
                     fluidRow(
                     column(4, align="center", offset = 4,
                            # Page title
                            titlePanel("The Problem, The Data, The Goal"),
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
            
            
            tabPanel(p("DIY Labeling"),
                     fluidRow(
                     column(4, align="center", offset = 4,
                            # Page title
                            titlePanel("Label it yourself"),
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
            
            tabPanel("Algorithm",
                     
                     
              mainPanel(
                column(6, offset=3,
                img(src="flowchart.jpeg", width="360px;")),
                
                
                fluidRow(align="center",
                         
                         actionButton(inputId = "back", label = "Back", style="color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-right:200px"),
                         actionButton(inputId = "next", label = "Next",style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
                ),
                
                
                
                
                ),
              sidebarPanel(h3("Algorithm steps"),
                           tags$ul(align="left",
                                   tags$li("First list item"), 
                                   tags$li("Second list item"), 
                                   tags$li("Third list item")
                           ),
                           
                           
                           )
              
              
              
              
              
            #end of tabpanel  
            ),
            
            
            tabPanel("Interactive",
                     
                     
                     mainPanel(
                       
                       DT::dataTableOutput("originaldata"),
                       
                       fluidRow(align="center",
                                
                                actionButton(inputId = "back", label = "Back", style="color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-right:200px"),
                                actionButton(inputId = "next", label = "Next",style="color: #fff; background-color: #337ab7; border-color: #2e6da4")
                       ),
                       
                       
                       
                       
                     ),
                     
            ),
            
            tabPanel('In the News'
                     
                     
            ),
            
            tabPanel("Gallery",
                     
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
