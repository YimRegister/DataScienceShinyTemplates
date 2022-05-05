d <- read.csv("popular_accounts.csv")

View(d)

library(tidytext)

get_sentiments("afinn")
get_sentiments("nrc")

library(dplyr)
library(stringr)

tidy_tweets <- d %>%
  group_by(twitter_name) %>%
  mutate(
    linenumber = row_number()) %>%
  ungroup() %>%
  unnest_tokens(word, text)

View(tidy_tweets)

bing_word_counts <- tidy_tweets %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE) %>%
  ungroup()
View(bing_word_counts)

bing_word_counts %>%
  group_by(sentiment) %>%
  slice_max(n, n = 10) %>% 
  ungroup() %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(n, word, fill = sentiment)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~sentiment, scales = "free_y") +
  labs(x = "Contribution to sentiment",
       y = NULL)


library(wordcloud)
nopes = c("https","t.co","http", "rt")
tidy_tweets %>%
  filter(twitter_name=="BillGates")%>%
  filter(!(word %in% nopes)) %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word, n, max.words = 100))


tidy_tweets %>%
  filter(twitter_name=="KimKardashian")%>%
  filter(!(word %in% nopes)) %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word, n, max.words = 100))


tidy_tweets %>%
  filter(twitter_name=="StephenCurry30")%>%
  filter(!(word %in% nopes)) %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word, n, max.words = 100))


tidy_tweets %>%
  filter(twitter_name=="BarackObama")%>%
  filter(!(word %in% nopes)) %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word, n, max.words = 100))

tidy_tweets %>%
  filter(twitter_name=="kanyewest")%>%
  filter(!(word %in% nopes)) %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word, n, max.words = 100))


tidy_tweets %>%
  filter(twitter_name=="AOC")%>%
  filter(!(word %in% nopes)) %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word, n, max.words = 100))

tidy_tweets %>%
  filter(twitter_name=="KingJames")%>%
  filter(!(word %in% nopes)) %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word, n, max.words = 100))

tidy_tweets %>%
  filter(twitter_name=="jovialjoy")%>%
  filter(!(word %in% nopes)) %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word, n, max.words = 100))

tidy_tweets %>%
  filter(twitter_name=="yrfatfriend")%>%
  filter(!(word %in% nopes)) %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word, n, max.words = 100))


