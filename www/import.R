# import.R
# group needed functions to run a code
# import needed libraries
importLibrary <- function() {
  library(ggplot2)
  library(ggthemes)
  library(plotly)
  library(dplyr)
  library(readr)
}

# import and view dataset
importDataset <- function() {
  alzheimer <- read_csv("./www/alzheimer.csv")
  View(alzheimer)
}