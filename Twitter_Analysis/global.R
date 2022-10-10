
library(tidyverse)
library(sortable)
library(tidytext)
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
#https://medium.com/@skyetetra/how-to-make-rtweet-r-shiny-apps-with-user-credentials-48acca246b58
library(jsonlite)
library(shinyWidgets)


colors <- c("#2D3362", "#FF8A70", "#FFDE70", "#60D2CB", "#E1E8F4")


res <- fromJSON("input.json")
algorithm_steps <- res$algorithmsteps

algorithm_steps_shuffled <- sample(algorithm_steps)

algorithm_steps_list <- rank_list(text = "Drag the steps into the right order",
                                  labels = algorithm_steps_shuffled,
                                  input_id = "algorithm_steps_list")