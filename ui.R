library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("Price prediction of houses in the U.S."),
        sidebarPanel(
                numericInput('sqft', 'Enter the number of living square feet of the house (1 sqm is about 11 sqft)', 2000, min = 100, max = 10000, step = 10),
                radioButtons("beds", "Enter number of bedrooms in the house",
                             c("1 bedroom" = 1,
                               "2 bedrooms" = 2,
                               "3 bedrooms" = 3,
                               "4 bedrooms" = 4,
                               "5 bedrooms" = 5,
                               "6 bedrooms" = 6,
                               "7 bedrooms" = 7,
                               "8 bedrooms" = 8)
                ),
                numericInput("baths", "Enter number of bathrooms in the house (a bathroom could be a half, 3/4 or a full bathroom)", 2, min = 0, max = 8, step = 0.25),
                actionButton(inputId ='submitButton', label = 'Submit')
        ),
        mainPanel(
                h6('This application predicts the price of a house located in the U.S.', align = 'left'),
                h6('Just fill in he number of living square feet of the house, the number of bedrooms and bathrooms.', align = 'left'),
                h6('Note, it is about 11 sqft on a square meter. Also note that in the U.S. a bathroom could be a half, 3/4 or a full bathroom', align = 'left'),
                h6('Note, also that this is a simple model for prediction of the price of a house.', align = 'left'),
                h6('A more advanced model would take other factors such as location,', align = 'left'),
                h6('i.e. zipcode and distance to the water, into account.', align = 'left'),
                textOutput('house'),
                textOutput('prediction')
        )
))