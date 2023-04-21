# Website to host all the graphs
# import needed libraries
library(shiny)
library(bslib)

# import functions
source("./www/import.R")
source("./www/gender_vs_group.R")
source("./www/male_vs_group.R")
source("./www/female_vs_group.R")

# import base dataset
alzheimer <- read_csv("./www/alzheimer.csv")

# Define UI ----
ui <- navbarPage("Alzheimer's",
  theme = bs_theme(version = 4, bootswatch = "sketchy"),
  
  tabPanel("Gender in dementia",
           h2("Gender in dementia"),
           plotlyOutput("genderBar"),
           
           fluidRow(
             column(3,
                    radioButtons("maleOrFemale", h3("Gender"),
                                 choices = list("Male" = 1, "Female" = 2), selected = 1),
                    ),
             
             column(5,
                    plotlyOutput("genderPie")
                    )
           )
          ),
  tabPanel("Factors in dementia"),
  tabPanel("About")
)

# Define server logic ----
server <- function(input, output) {
  output$genderBar <- renderPlotly({
    barGenderVsGroup
  })
  
  output$genderPie <- renderPlotly({
    if(input$maleOrFemale == 1)
      pieMaleVsGroup
    else
      pieFemaleVsGroup
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)