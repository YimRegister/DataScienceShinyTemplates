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






# Define shiny UI
shinyUI(fluidPage(
  theme = "bootstrap.css",
  
  # begin the navbar
  navbarPage(id = "menu",
    emo::ji("rainbow"),
    
    # INTRODUCTION
    tabPanel(Title = "Intro", value = "intro",
      p("Intro"),
      
      column(
        8,
        align = "center",
        offset = 2,
        # Page title
        titlePanel("Introduction"),
        #h1(emo::ji("computer")),
        p("_______________"),
        
        # Behavior
        img(src = "computer.jpeg", align = "center", width="20%"),
        wellPanel(style = "background: #E1E8F4", textOutput("introtext")),
        
        br(),
        
        textInput("username", "What's your name?"),
        br(),
        #actionButton(
         # inputId = "back",
         # label = "Back",
         # style = "color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-right:200px"
       # ),
        
        actionButton(
          inputId = "next1",
          label = "Next",
          style = "color: #fff; background-color: #337ab7; border-color: #2e6da4"
        ),
      ),
      #end of tabpanel
      
      
    ),
    
    
    
    # LEARNING GOALS FOR THIS LESSON
    tabPanel(value = "learningtargets",
      p("Learning Targets"),
      fluidRow(
        column(
          8,
          align = "center",
          offset = 2,
          # Page title
          
          titlePanel("Learning Targets"),
          h1(emo::ji("target")),
          p("_______________"),
          
          
          # Behavior
          wellPanel(style = "background: #E1E8F4",
            p("By the end of the lesson, you'll know more about:"),
            
            tags$ul(
              uiOutput('learningtarget_list'), align="left"
            ),
            p("_______________"),
            uiOutput("makeyourowngoal"),
            
            #at the end we will see if they 'achieved' their goal
            textInput(
              "mygoal",
              "My goal:",
              "learn about data science..."
            ),
          )
        )
      ),
      
      fluidRow(
        align = "center",
        
        actionButton(
          inputId = "back2",
          label = "Back",
          style = "color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-right:200px"
        ),
        actionButton(
          inputId = "next2",
          label = "Next",
          style = "color: #fff; background-color: #337ab7; border-color: #2e6da4"
        )
      ),
      
      
      
      
      #end of tabpanel
    ),
    
    # THE PROBLEM, THE DATA, THE OUTPUT
    tabPanel(value = "problemdataoutput",
      p("Problem, Data, Output"),
      fluidRow(column(
        4,
        align = "center",
        offset = 4,
        # Page title
        titlePanel("Problem, Data, Output"),
        h1(emo::ji("gear")),
        p("__________________")
        
      )),
      
      fluidRow(
        column(4, h4("Problem: What are we trying to solve?"),wellPanel(style = "background: #60D2CB",textOutput("theproblem"))),
        column(4, h4("Data: What data will we look at?"),wellPanel(style = "background: #FFDE70",textOutput("thedata"),br())),
        column(4, h4("Output: What will we get in the end?"),wellPanel(style = "background: #FF8A70",textOutput("theoutput")))
      ),
      
      fluidRow(
        align = "center",
        
        actionButton(
          inputId = "back3",
          label = "Back",
          style = "color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-right:200px"
        ),
        
        actionButton(
          inputId = "next3",
          label = "Next",
          style = "color: #fff; background-color: #337ab7; border-color: #2e6da4"
        ),
      )
      
      
      #end of tabpanel
    ),
    
    # LABEL SOME DATA
    tabPanel(value = "diylabel",
      p("DIY Labeling"),
      fluidRow(column(
        6,
        align = "center",
        offset = 3,
        # Page title
        titlePanel("Label it yourself"),
        h1(emo::ji("memo")),
        span(textOutput("labelinstructions"),style="font-size: 20px"),
        
        p("_______________"),
        
        
        
        # Behavior
        
      ),),
      fluidRow(
        column(4, wellPanel(style = "background: #E1E8F4",
         
          
          uiOutput(outputId="labelit1"),
          
          br(),br(), #sometimes you have to add in br() tags just to get the panels to line up. Up to you, personal preference
          textInput(label = "Your Label", inputId = "yourlabel1"),
          br(),
          sliderInput("label3ease", "How easy was this to label? 1 being difficult to come up with a label, 5 being very easy to come up with a label:",
                      min = 1, max = 5,
                      value = 1),
          
          
          
        )),
        
        column(4, wellPanel(style = "background: #E1E8F4",
          
          
          uiOutput(outputId="labelit2"),
          br(),br(),
          textInput(label = "Your Label", inputId = "yourlabel2"),
          br(),
          sliderInput("label3ease", "How easy was this to label? 1 being difficult to come up with a label, 5 being very easy to come up with a label:",
                      min = 1, max = 5,
                      value = 1),
          
          
          
        )),
        
        column(4, wellPanel(style = "background: #E1E8F4",
         
          
          uiOutput(outputId="labelit3"),
          br(),br(),
          textInput(label = "Your Label", inputId = "yourlabel3"),
          br(),
          sliderInput("label3ease", "How easy was this to label? 1 being difficult to come up with a label, 5 being very easy to come up with a label:",
                      min = 1, max = 5,
                      value = 1),
          
          
        )),
        
        
        
        
        
      ),
      
      
      fluidRow(
        align = "center",
        
        actionButton(
          inputId = "back4",
          label = "Back",
          style = "color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-right:200px"
        ),
        actionButton(
          inputId = "next4",
          label = "Next",
          style = "color: #fff; background-color: #337ab7; border-color: #2e6da4"
        )
      ),
      
      
      #end of tabpanel
    ),
    
    
    
    # ALGORITHM STEPS (HIGH LEVEL) # what if the student could fill this in themselves? or drag and drop order the steps?????remotes::install_github("rstudio/sortable")
    tabPanel(value = "algorithmsteps",
      "Algorithm Steps",
      
      
      column(
        width = 8,
        align = "center",
        offset = 2,
        
        h2("How does the algorithm work?"),
        h1(emo::ji("shuffle")),
        p("_______________"),
        algorithm_steps_list,
        tags$b("Result"),
        htmlOutput("sorting_accuracy"),
       
        
        br(),
        
        fluidRow(
          align = "center",
          
          actionButton(
            inputId = "back5",
            label = "Back",
            style = "color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-right:200px"
          ),
          actionButton(
            inputId = "next5",
            label = "Next",
            style = "color: #fff; background-color: #337ab7; border-color: #2e6da4"
          )
        )
      )
      
      
      
      
      
      
      
      
      #end of tabpanel
    ),
    
    # INTERACTIVE DASHBOARD
    tabPanel(value = "interactivedashboard",
      "Let's Play",
      column(
        width = 12,
        align = "center",
        offset = 0,
        h2("Let's Play"),
        h1(emo::ji("magnifying")),
        p("_______________"),
        p(paste(paste(emo::ji("warning"), "This AWS software is gender biased. It may misgender photos of trans, nonbinary, and genderfluid individuals. No matter the result, you are loved and your identity is respected."),emo::ji("warning"))),
        
        
        
        sidebarLayout(
          # Sidebar with a slider input for number of bins
          mainPanel( width = 5,
                     fileInput("upload", "Upload image", accept = "image/png"),
                     uiOutput("image"),
                     br(), br(),
                     actionButton("analyze_button", "Analyze", style="background-color:#FF8A70"),
                     br(),
                     br()
                     
                     
          ),
          sidebarPanel(width=7,style = "background: #E1E8F4",
                       h3("Face Analysis Results"),
                       p(emo::ji("smile")),
                       #verbatimTextOutput("emotions"),
                       h4("Emotions Detected:"),
                       p("This shows a graph of the emotions detected in the face, along with a confidence score for each emotion -- how certain the software is of that label"),
                       plotlyOutput("emotion_plot"),
                       br(),
                       h4("Age Detected:"),
                       p("This gives an age range for the person in the photo."),
                       verbatimTextOutput("age_detected"),
                       br(),
                       h4("Gender Detected:"),
                       p("This outputs a binary gender label, and then the confidence score -- how certain the software is of that label"),
                       verbatimTextOutput("gender_detected"),
                       br(),
                       h4("Eyes Open Detected:"),
                       p("This outputs TRUE if the eyes are OPEN, and FALSE if they eyes are CLOSED. It also gives a confidence score -- how certain the software is of that label"),
                       verbatimTextOutput("eyesopen_detected")
          )),
        
        fluidRow(
          align = "center",
          
          actionButton(
            inputId = "back6",
            label = "Back",
            style = "color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-right:200px"
          ),
          actionButton(
            inputId = "next6",
            label = "Next",
            style = "color: #fff; background-color: #337ab7; border-color: #2e6da4"
          )
        ),
        
        
        
        
      ),
      
    ),
    
    # RELEVANT EXAMPLE
    tabPanel(value = "inthenews",
      'In the News',
      
      column(
        width = 8,
        align = "center",
        offset = 2,
        h2("In the News"),
        h1(emo::ji("newspaper")),
        p("_______________"),
        
        
        htmlOutput("frame", width="60%"),
        
        fluidRow(
          align = "center",
          
          actionButton(
            inputId = "back7",
            label = "Back",
            style = "color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-right:200px"
          ),
          actionButton(
            inputId = "next7",
            label = "Next",
            style = "color: #fff; background-color: #337ab7; border-color: #2e6da4"
          )
        ),
      )
    ),
    
    # CRITICAL DISCUSSION PROMPTS
    tabPanel(value = "discussion",
      'Discussion Prompts',
      column(
        width = 10,
        align = "center",
        offset = 1,
        h2("What do YOU think?"),
        h1(emo::ji("light_bulb")),
        p("_______________"),
        
        wellPanel(style = "background: #60D2CB;width: 75%;",span(textOutput("dq1"),style="font-size: 20px")),
        textAreaInput("dq1_input", "", width = "70%", resize="vertical"),
        br(),
        wellPanel(style = "background: #FFDE70;width: 75%;",span(textOutput("dq2"),style="font-size: 20px;")),
        textAreaInput("dq2_input","", width = "70%", resize="vertical"),
        br(),
        wellPanel(style = "background: #FF8A70;width: 75%;",span(textOutput("dq3"),style="font-size: 20px")),
        textAreaInput("dq3_input","",width = "70%", resize="vertical"),
        br(),
        wellPanel(style = "background: #E1E8F4;width: 75%;",span(textOutput("dq4"),style="font-size: 20px")),
        textAreaInput("dq4_input","",width = "70%", resize="vertical"),
        br(),
        
        
        fluidRow(
          align = "center",
          
          actionButton(
            inputId = "back8",
            label = "Back",
            style = "color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-right:200px"
          ),
          actionButton(
            inputId = "next8",
            label = "Next",
            style = "color: #fff; background-color: #337ab7; border-color: #2e6da4"
          )
        ),
        br(),
        br(),
        
      ),
    ),
    
    
    
    tabPanel(value = "tiktok",
      "TikTok Time",
      
      column(
        width = 8,
        align = "center",
        offset = 2,
        h2("Tik Tok Time"),
        h1(emo::ji("mobile_phone")),
        p("_______________"),
      ),
      
      sidebarPanel(
        p("Upload yours"),
        fileInput("file1", "Upload", accept = ".csv"),
        actionButton(
          inputId = "back9",
          label = "Back",
          style = "color: #fff; background-color: #337ab7; border-color: #2e6da4; margin-right:200px"
        ),
        
        
        
      ),
      fluidPage(
        column(
          6,
          tiktok_html(
            "https://www.tiktok.com/@computing.simplified/video/6989722588050230534?is_from_webapp=1&sender_device=pc"
          )
        ),
        column(
          6,
          tiktok_html(
            "https://www.tiktok.com/@computing.simplified/video/6989045577883389190?is_from_webapp=1&sender_device=pc&web_id=7088017589272462891"
          )
        ),
        column(
          6,
          tiktok_html(
            "https://www.tiktok.com/@computing.simplified/video/6989279020575739142?is_from_webapp=1&sender_device=pc&web_id=7088017589272462891"
          )
        )
      )
      
    ),
    
  )
))
