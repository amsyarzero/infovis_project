# Website to host all the graphs
# import needed libraries
library(shiny)
library(bslib)

# import functions
source("./www/gender_vs_group.R")
source("./www/male_vs_group.R")
source("./www/female_vs_group.R")

source("./www/age_vs_mmse.R")
source("./www/age_vs_cdr.R")
source("./www/age_vs_etiv.R")

source("./www/educ_vs_mmse.R")
source("./www/educ_vs_cdr.R")
source("./www/educ_vs_etiv.R")

source("./www/ses_vs_mmse.R")
source("./www/ses_vs_cdr.R")
source("./www/ses_vs_etiv.R")

source("./www/nwbv_vs_mmse.R")
source("./www/nwbv_vs_cdr.R")
source("./www/nwbv_vs_etiv.R")

# import base dataset
alzheimer <- read_csv("./www/alzheimer.csv")

# Define UI ----
ui <- navbarPage("Alzheimer's",
  windowTitle = "Amogus",
  header = tags$head(tags$link(rel = "shortcut icon", href = "./www/favicon.ico")),
  theme = bs_theme(version = 4, bootswatch = "sketchy"),
  
  tabPanel("Gender in dementia",
           h2("Gender in dementia"),
           plotlyOutput("genderBar"),
           
           fluidRow(
             column(3,
                    radioButtons("maleOrFemale", h3("Gender"),
                                 choices = list("Male" = 1, "Female" = 2), selected = 1)
                    ),
             
             column(5,
                    plotlyOutput("genderPie")
                    )
           )
          ),
  tabPanel("Factors in dementia",
           fluidRow(
             column(2,
                    radioButtons("xAxis", h3("X Axis"),
                                 choices = list("Age" = 1, "Years of education" = 2,
                                                "Socioeconomic status" = 3, "Normalized Whole Brain Volume" = 4), selected = 1)
                    ),
             
             column(2,
                    radioButtons("yAxis", h3("Y Axis"),
                                 choices = list("Mini-Mental State Examination" = 1, "Clinical Dementia Rating" = 2,
                                                "Estimated Total Intracranial Volume" = 3), selected = 1)
             ),
           ),
           tags$br(),
           plotlyOutput("factorChart")
          ),
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
  
  output$factorChart <- renderPlotly({
    if(input$xAxis == 1) {
      if(input$yAxis == 1)
        scatterAgeVsMMSE
      else if(input$yAxis == 2)
        scatterAgeVsCDR
      else
        scatterAgeVsETIV
    } else if(input$xAxis == 2) {
      if(input$yAxis == 1)
        scatterEducVsMMSE
      else if(input$yAxis == 2)
        scatterEducVsCDR
      else
        scatterEducVsETIV
    } else if(input$xAxis == 3) {
      if(input$yAxis == 1)
        scatterSesVsMMSE
      else if(input$yAxis == 2)
        scatterSesVsCDR
      else
        scatterSesVsETIV
    } else {
      if(input$yAxis == 1)
        scatterNwbvVsMMSE
      else if(input$yAxis == 2)
        scatterNwbvVsCDR
      else
        scatterNwbvVsETIV
    }
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)