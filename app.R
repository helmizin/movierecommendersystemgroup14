library(shiny)
library(proxy)
library(recommenderlab)
library(reshape2)
source("helper.R")



Z <- shinyUI(fluidPage(
    titlePanel("Movie Recommender System"),img(src="tele4.png",height=500, width=900),
    fluidRow(
        column(5,
               selectInput("select", label = h3("Choose your top 3 favorite movies",style="color:green"),
                           choices = as.character(movies2$title)),
               
               selectInput("select2", label = NA,
                           choices = as.character(movies2$title)),
               
               selectInput("select3", label = NA,
                           choices = as.character(movies2$title)),
               
               submitButton("Show me some movies")
               
        ),
        
        column(7,
               h3("Why don't you try these movies!",style="color:green"),
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
