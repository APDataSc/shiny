library(shiny)

setwd("C:/Users/Invitado/Desktop/apli")

load("bdd.rda")
bdd <- bdd

# Define UI for miles per gallon application
shinyUI(fluidPage(
        
        # Application title
        titlePanel("Artículos del IPC"),
        
        # Sidebar with controls to select the variable to plot against
        # mpg and to specify whether outliers should be included
        sidebarLayout(
                sidebarPanel(
                        selectInput("variable", "Variable:",
                                    unique(bdd$nom_ccif)),
                        
                        checkboxInput("outliers", "Show outliers", FALSE)
                ),
                
                # Show the caption and plot of the requested variable against
                # mpg
                mainPanel(
                        h3(textOutput("caption")),
                        
                        plotOutput("mpgPlot")
                )
        )
))