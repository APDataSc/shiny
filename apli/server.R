library(shiny)

setwd("C:/Users/Invitado/Desktop/apli")

# We tweak the "am" field to have nicer factor labels. Since
# this doesn't rely on any user inputs we can do this once at
# startup and then use the value throughout the lifetime of the
# application

load("bdd.rda")
bdd <- bdd


# Define server logic required to plot various variables against
# mpg
shinyServer(function(input, output) {
        
        # Compute the formula text in a reactive expression since it is
        # shared by the output$caption and output$mpgPlot functions
        formulaText <- reactive({
                paste(input$variable, "~ bdd$id_t")
        })
        
        # Return the formula text for printing as a caption
        output$caption <- renderText({
                formulaText()
        })
        
        # Generate a plot of the requested variable against mpg and
        # only include outliers if requested
        output$mpgPlot <- renderPlot({
                boxplot(bdd$precio ~ bdd$id_t,
                        data = bdd, subset = bdd$nom_ccif == input$variable)              
                
                
        })
})