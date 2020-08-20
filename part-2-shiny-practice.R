# title: "Shiny Part 2: Practice building an app"
# author: Dan Turner (dturner@u.northwestern.edu)

# Practice section

## Modify the code below to dynamically plot the duration of the fight song for each school within each conference as a pie chart. Each page will have 1 conference, selected by dropdown menu, and each school will be 1 slice of the pie.




# Packages
library(shiny)     # For building interactive apps
library(tidyverse) # For tidy data wrangling, plotting, etc.
library(plotly)    # For reactive plots
library(rsconnect) # For RStudio to work with shiny

fight_songs <- read_csv("fight-songs.csv")  # Load a dataset


# User Interface section
ui <- fluidPage(
  
  # MODIFY HERE
  titlePanel(), # title the app
  
  selectInput(), # give your users a dropdown of conferences
  
  plotlyOutput(), # the plotly output; must match whatever comes after output$ in the server
  
)


# Server section
server <- function(input, output) {
  
  selectedData <- reactive({
    fight_songs %>% 
      filter(conference == input$conf)
  })
  
  output$the.plotly <- renderPlotly({
    
    # MODIFY HERE
    plot_ly(selectedData(),
            labels = , # one slice per school
            values = , # total the 
            type = , # pie chart will be 'pie'
            textinfo = 'value+percent') # show the value as well as the proportion
  })
  
}

shinyApp(ui = ui, server = server)

# run it!