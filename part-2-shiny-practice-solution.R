# title: "Shiny Part 2: Practice building an app"
# author: Dan Turner (dturner@u.northwestern.edu)

# Practice section solutions

# Packages
library(shiny)     # For building interactive apps
library(tidyverse) # For tidy data wrangling, plotting, etc.
library(plotly)    # For reactive plots
library(rsconnect) # For RStudio to work with shiny

fight_songs <- read_csv("fight-songs.csv")  # Load a dataset

# User Interface section
ui <- fluidPage(
  
  titlePanel("Fight Songs Duration App"), # title
  
  selectInput(inputId = "conf", # a drop down works well for this list of conferences
              label = "Select a conference", 
              selected = "Big Ten",
              choices = unique(fight_songs$conference)),

  plotlyOutput("the.plotly"), # outputs the plotly into the UI
  
)

# Server section
server <- function(input, output) {
  
  selectedData <- reactive({
    fight_songs %>% 
      filter(conference == input$conf)
  })
  
output$the.plotly <- renderPlotly({
  
  plot_ly(selectedData(), 
          labels = ~school, 
          values = ~sec_duration, 
          type = 'pie', 
          textinfo = 'value+percent')
})

}

shinyApp(ui = ui, server = server)
