sales <- read.csv('../data/home_data.csv', header = TRUE)




sales_model <- lm(price ~ sqft_living + bedrooms + bathrooms, data = sales)

sales_model$coefficients

summary(sales_model)

Beta0 <- sales_model$coefficients[1]
Beta1 <- sales_model$coefficients[2]
Beta2 <- sales_model$coefficients[3]
Beta3 <- sales_model$coefficients[4]

housePricePrediction <- function(sqft_living, bedrooms, bathrooms) {
        Beta0 <- 74847.14
        Beta1 <- 309.3924
        Beta2 <- -57860.89 
        Beta3 <- 7932.713
        return(round(Beta0 + Beta1*sqft_living + Beta2*bedrooms + Beta3*bathrooms,-3))
}

housePricePrediction(1000,2,2)
housePricePrediction(3000,6,4)
