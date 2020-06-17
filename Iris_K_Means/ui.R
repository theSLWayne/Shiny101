#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
cols <- setdiff(names(iris), "Species")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Iris K-Means Clustering"),

    # Sidebar with inputs for clustering parameters
    sidebarLayout(
        sidebarPanel(
            # Dropdown to select the X variable
            selectInput('xdata', 'X Variable', cols, selected = cols[[1]]),
            # Dropdown to select the Y variable
            selectInput('ydata', 'Y Variable', cols, selected = cols[[2]]),
            # Numeric Input to specify the number of clusters wanted
            numericInput('nClusters', 'Number of clusters', 3, min = 1, max = 9)
        ),

        # Show a plot of the generated clustering model
        mainPanel(
            plotOutput("plot1")
        )
    )
))
