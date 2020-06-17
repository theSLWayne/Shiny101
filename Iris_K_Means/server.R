#
# This is the server logic of a Shiny web application.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    # Creating a dataframe with  selected columns for X and Y.
    dataSelected <- reactive({
        iris[, c(input$xdata, input$ydata)]
    })
    
    # Creating clusters
    clusters <- reactive({
        kmeans(dataSelected(), input$nClusters)
    })

    output$plot1 <- renderPlot({

        # Defining color palette for different clusters
        palette(c("navyblue", "red", "darkgray", "green", "lightblue", "lightgreen",
                  "magenta", "cyan", "purple"))
        
        # Setting graphical parameters. Setting margins
        # mar = c(bottom, left, top, right)
        par(mar = c(4, 4, 0, 1))
        # Plotting
        plot(dataSelected(), 
             col = clusters()$cluster,
             pch = 20, cex = 3,
             xlab = input$xdata,
             ylab = input$ydata)
        # Plotting the centers of clusters
        points(clusters()$centers, pch = 4, cex = 4, lwd = 4)

    })

})
