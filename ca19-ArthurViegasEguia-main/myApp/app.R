library(tidyverse)
library(shiny)
library(dplyr)
library(babynames)


ui <- fluidPage(
  titlePanel("Baby Names Trend"),
  sidebarLayout(
    sidebarPanel(
      textInput("name", "Enter a Baby Name:", "Emma"),
      selectInput("gender", "Select Gender:", choices = c("Male" = "M", "Female" = "F")),
      actionButton("go", "Show Trend")
    ),
    mainPanel(plotOutput("myPlot"))
  )
)


server <- function(input, output) {
  nameData <- eventReactive(input$go, {
    req(input$name) # Ensure the name input is not empty
    babynames %>% 
      filter(name == isolate(input$name), sex == isolate(input$gender))
  })
  
  
  output$myPlot <- renderPlot({
    req(input$name) 
    ggplot(nameData(), aes(x = year, y = n)) +
      geom_line() +
      labs(title = paste("Trend for name", isolate(input$name)),
           x = "Year", y = "Number of Babies") +
      theme_minimal()
  })
}


shinyApp(ui, server)