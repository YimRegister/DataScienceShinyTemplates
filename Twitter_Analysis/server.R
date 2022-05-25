

library(shiny)
library(tiktokrmd)
library(sortable)
library(tidytext)
library(dplyr)
library(stringr)



d <- read.csv("popular_accounts.csv")
d <- d[,-which(names(d) %in% c("X"))]

# also maybe filter out retweets



tidy_tweets <- d %>%
  group_by(twitter_name) %>%
  mutate(linenumber = row_number()) %>%
  ungroup() %>%
  unnest_tokens(word, text)

library(wordcloud)
nopes = c("https", "t.co", "http", "rt", "amp")


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
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
    selectInput("author_select", "Author", choices = unique(as.character(d$author[d$Type ==
                                                                                    input$type_choice])))
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
  
  
  
})
