library(shiny)
library(proxy)
library(recommenderlab)
library(reshape2)
source("helper.R")



Z <- shinyUI(fluidPage(
  titlePanel("Movie Recommendation Engine"),img(src="tele4.png",height=500, width=900),
  fluidRow(
    column(5,
           selectInput("select", label = h3("Select Your 3 Favorite Movies",style="color:green"),
                       choices = as.character(movies2$title)),
           
           selectInput("select2", label = NA,
                       choices = as.character(movies2$title)),
           
           selectInput("select3", label = NA,
                       choices = as.character(movies2$title)),
           
           submitButton("Show me some movies")
           
    ),
    
    column(7,
           h3("Check out these titles!",style="color:green"),
           tableOutput("table"))
  )
))




V <-shinyServer(function(input, output) {
  
  output$table <- renderTable({
    movie_recommendation(input$select, input$select2, input$select3)
  })
  
}
)


shinyApp(ui = Z, server = V )
