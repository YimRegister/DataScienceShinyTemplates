
library(plotly)
library(sortable)
d <- iris
#https://medium.com/@skyetetra/how-to-make-rtweet-r-shiny-apps-with-user-credentials-48acca246b58
library(jsonlite)
library(shinyWidgets)

library(paws)  # used for AWS configuration
library(magick)  # used for image functions
library(tidyverse)

#aws_access_key_id = ""
#
aws_secret_access_key = ""
Sys.setenv(AWS_ACCESS_KEY_ID = "", AWS_SECRET_ACCESS_KEY ="", AWS_REGION = "")
svc <- rekognition()

library(shiny)
colors <- c("#2D3362", "#FF8A70", "#FFDE70", "#60D2CB", "#E1E8F4")


res <- fromJSON("input.json")
algorithm_steps <- res$algorithmsteps

algorithm_steps_shuffled <- sample(algorithm_steps)

algorithm_steps_list <- rank_list(text = "Drag the steps into the right order",
                                  labels = algorithm_steps_shuffled,
                                  input_id = "algorithm_steps_list")