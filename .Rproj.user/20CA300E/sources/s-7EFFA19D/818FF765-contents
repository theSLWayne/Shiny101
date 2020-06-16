#
# This is the user-interface definition of a Shiny web application.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for the application
shinyUI(fluidPage(

    # Application title
    titlePanel("Plot Random Numbers"),

    # Sidebar with inputs to be used by the user to tweak
    sidebarLayout(
        sidebarPanel(
            numericInput("numeric", "Number of Random Numbers to be plotted:",
                         value = 500, min = 1, max = 1000, step = 1),
            sliderInput("sliderX", "Set minimum and maximum x values:",
                        -100, 100, value = c(-50, 50)),
            sliderInput("sliderY", "Set minimum and maximum y values:",
                        -100, 100, value = c(-50, 50)),
            checkboxInput("xlab", "Show/Hide label of x axis:", value = T),
            checkboxInput("ylab", "Show/Hide label of y axis:", value = T),
            checkboxInput("showTitle", "Show/Hide title of the plot:", value = T),
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot1")
        )
    )
))
