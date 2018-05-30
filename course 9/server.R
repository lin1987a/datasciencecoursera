#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram

shinyServer(function(input, output) {
    
    # remodel whenever points selected are changed.
    model <- reactive({
        brushed_data <- brushedPoints(mtcars, input$myBrush,
                                     xvar = input$variable, yvar = "mpg")
        if(nrow(brushed_data) < 2){
            return(NULL)
        }
        lm(brushed_data$mpg ~ brushed_data[ ,input$variable])
    })

    # display the estimates to the UI
    output$slopeOut <- renderText({
        if(is.null(model())){
            "no model found"
        }else{
            model()[[1]][2]
        }
    })

    output$intOut <- renderText({
        if(is.null(model())){
            "no model found"
        }else{
            model()[[1]][1]
        }
    })

    # plot the points and draw a regression line based on selected points
    output$myPlot <- renderPlot({
        plot(mtcars[, input$variable], mtcars$mpg, 
             xlab = input$variable, ylab = "mpg",
             main = paste("Plot of MPG and ", input$variable), 
             cex = 1.5, pch = 16, bty = 'n')
        if(!is.null(model())){
            abline(model(), col = "blue", lwd = 2)
        }
    })
})

