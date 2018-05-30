#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application

shinyUI(fluidPage(

    # Application title
    titlePanel("Explore Regressions"),

    # radio buttons to select a variable
    sidebarLayout(
        sidebarPanel(
            h3("Select a Variable"),
            radioButtons("variable", NULL,
                        c("Weight" = "wt",
                          "1/4 mile time" = "qsec",
                          "Transmission" = "am")),
            h3("Fit of Selected"),
            h4("Slope"),
            textOutput("slopeOut"),
            h4("intercept"),
            textOutput("intOut")
        ),

        # Show a plot of the selected varable
        mainPanel(
            plotOutput("myPlot", brush = brushOpts(id = "myBrush"))
        )
    )
))
