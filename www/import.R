# import needed libraries
library(ggplot2)
library(ggthemes)
library(plotly)
library(dplyr)
library(readr)

# verify current directory as working directory
getwd()

# import and view dataset
alzheimer <- read_csv("./www/alzheimer.csv")
View(alzheimer)

