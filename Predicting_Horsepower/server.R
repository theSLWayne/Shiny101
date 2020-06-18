#
# This is the server logic of a Shiny web application.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic
shinyServer(function(input, output) {
    # Using R built-in dataset mtcars for this application.
    cars <- mtcars
    # Creating a new variable with a breaking point at 20. mpgsp of every car that has 
    #  smaller mpg than 20 will be set to 0 and every car that has mpg will have a mpgsp
    #  value of 20 - mpg.
    cars$mpgsp <- ifelse(cars$mpg - 20 > 0, cars$mpg - 20, 0)
    # The first model, training with only mpg.
    model1 <- lm(hp ~ mpg, data = cars)
    # The second model, training with mpg and mpgsp.
    model2 <- lm(hp ~ mpg + mpgsp, data = cars)
    
    # Prediction with model1
    model1Pred <- reactive({
        mpgIn <- input$mpgIn
        predict(model1, newdata = data.frame(mpg = mpgIn))
    })
    # Prediction with model2
    model2Pred <- reactive({
        mpgIn <- input$mpgIn
        predict(model2, newdata = data.frame(mpg = mpgIn,
                                             mpgsp = ifelse(mpgIn - 20 > 0, 
                                                            mpgIn - 20, 0)))
    })
    
    # Output the plot
    output$plot1 <- renderPlot({
        mpgIn <- input$mpgIn
        
        plot(cars$mpg, cars$hp, xlab = "Miles Per Gallon(MPG)",
             ylab = "Horsepower", bty = "n", pch = 16, xlim = c(10, 35),
             ylim = c(50, 350))
        if(input$showM1){
            abline(model1, col = "red", lwd = 2)
        }
        if(input$showM2){
            linesM2 <- predict(model2, newdata = data.frame(
                mpg = 10:35, mpgsp = ifelse(10:35 - 20 > 0, 10:35 - 20, 0)
            ))
            lines(10:35, linesM2, col = "blue", lwd = 2)
        }
        legend(25, 250, c("Model1 Prediction", "Model2 Prediction"), pch = 16,
               col = c("red", "blue"), bty = "n", cex = 1.2)
        points(mpgIn, model1Pred(), col = "red", pch = 16, cex = 2)
        points(mpgIn, model2Pred(), col = "blue", pch = 16, cex = 2)
    })
    # Output prediction from model1
    output$pred1 <- renderText({
        model1Pred()
    })
    # Output prediction from model2
    output$pred2 <- renderText({
        model2Pred()
    })
})
