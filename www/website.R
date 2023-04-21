# Website to host all the graphs
# import needed libraries
library(shiny)
library(bslib)

# Define UI ----
ui <- fluidPage(
  theme = bs_theme(version = 4, bootswatch = "sketchy"),
  
  titlePanel("Alzheimer's"),
  
  navlistPanel(
    tabPanel("Gender studies"),
    tabPanel("Factors in dementia"),
    tabPanel("About")
  )
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)