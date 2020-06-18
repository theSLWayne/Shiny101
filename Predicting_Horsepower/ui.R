#
# This is the user-interface definition of a Shiny web application.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application
shinyUI(fluidPage(

    # Application title
    titlePanel("Predicting Horsepower of a car from MPG"),

    # Sidebar with inputs
    sidebarLayout(
        sidebarPanel(
            sliderInput("mpgIn", "MPG(Miles Per Gallon) of the car?",
                        10, 35, value = 15),
            checkboxInput("showM1", "Show/Hide Model 1 Predictions", value = T),
            checkboxInput("showM2", "Show/Hide Model 1 Predictions", value = T)
        ),

        # Show plot and prediction/s
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted Horsepower: Model 1"),
            textOutput("pred1"),
            h3("Predicted Horsepower: Model 2"),
            textOutput("pred2")
        )
    )
))
