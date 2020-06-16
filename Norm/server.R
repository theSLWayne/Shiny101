#
# This is the server logic of a Shiny web application.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic for the application
shinyServer(function(input, output) {

    output$plot1 <- renderPlot({
        set.seed(1234)
        # Retrieving the number of points from numeric input.
        nPoints <- input$numeric
        # Retrieving other range data from slider inputs
        minX <- input$sliderX[1]
        maxX <- input$sliderX[2]
        minY <- input$sliderY[1]
        maxY <- input$sliderY[2]
        # Creating Random Uniform Distributions
        dataX <- runif(nPoints, minX, maxX)
        dataY <- runif(nPoints, minY, maxY)
        # Functionality to toggle between showing/hiding labels
        xlab <- ifelse(input$xlab, "x axis", "")
        ylab <- ifelse(input$ylab, "x axis", "")
        main <- ifelse(input$showTitle, "Uniform Distribution", "")
        plot(dataX, dataY, xlab = xlab, ylab = ylab, main = main,
             xlim = c(-100,100), ylim = c(-100,100))
    })

})
