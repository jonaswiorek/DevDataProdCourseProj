library(shiny)
library(UsingR)
data(galton)

housePricePrediction <- function(sqft_living, bedrooms, bathrooms) {
        Beta0 <- 74847.14
        Beta1 <- 309.3924
        Beta2 <- -57860.89 
        Beta3 <- 7932.713
        return(round(Beta0 + Beta1*sqft_living + Beta2*bedrooms + Beta3*bathrooms,-3))
}

shinyServer(
        function(input, output) {
                output$sqft <- renderText({
                        input$submitButton
                        isolate(input$sqft)})
                output$beds <- renderText({input$beds})
                output$baths <- renderText({input$baths})
                output$house <- renderText({
                        input$submitButton
                        isolate(paste('A house of',format(input$sqft, big.mark = ' '),
                                                  'sqft with',input$beds,
                                                  'bedroom(s) and', input$baths, 
                                                  'bathroom(s)',
                                                  'has a predicted value of:'))})
                output$prediction <- renderText({
                        input$submitButton
                        isolate(paste(format(housePricePrediction(input$sqft, 
                                                           as.integer(input$beds), 
                                                           as.integer(input$baths)), big.mark = ' ')
                                      ,'$')
                                )
                        })
        }
)
