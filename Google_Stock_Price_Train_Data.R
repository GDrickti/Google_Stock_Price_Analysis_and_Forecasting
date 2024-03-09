setwd("C:/Users/Goutami Das/OneDrive/Documents/R") 
library(readr)
Google_Stock_Price_Train <- read_csv("Google_Stock_Price_Train.csv", 
                                     col_types = cols(Date = col_date(format = "%m/%d/%Y"), 
                                                      Open = col_number(), High = col_number(), 
                                                      Low = col_number(), Close = col_number(), 
                                                      Volume = col_number()))
View(Google_Stock_Price_Train)
Google_Stock2 <- Google_Stock_Price_Train[c(1:100),]
hist(Google_Stock2$Open)
plot(Google_Stock2)
boxplot(Google_Stock2)
library(ggplot2)
ggplot(data = Google_Stock2, mapping = aes(x = Open, y = High)) + geom_line(colour = "green") + geom_point(colour = "red")
ggplot(data = Google_Stock2, mapping = aes(x = Open, y = Low)) + geom_boxplot(colour = "green") 
ggplot(data = Google_Stock2, mapping = aes(x = Open, y = Volume)) + geom_line(colour = "red") 
ggplot(data = Google_Stock2, mapping = aes(x = Open, y = Close)) + geom_line(colour = "blue") + geom_point(colour = "red")
ggplot(data = Google_Stock2, mapping = aes(x = Open,)) + geom_line(aes(y = High), colour = "green") + geom_line(aes(y = Low), colour = "yellow") 

# Load necessary libraries
library(forecast)
library(TTR)
library(ggplot2)

# Assuming 'data' is your DataFrame and 'Close' is the column you want to forecast
Google_Stock_Price_Train$Moving_Average <- SMA(Google_Stock_Price_Train$Close, n=3)

# Plot original data and moving average
ggplot(Google_Stock_Price_Train, aes(x=Date)) +
  geom_line(aes(y=Close, colour = "Original Data")) +
  geom_line(aes(y=Moving_Average, colour = "Moving Average Forecast")) +
  labs(title = "Moving Average Forecasting", x = "Date", y = "Close Price", colour = "Legend") +
  theme_minimal()


# Exponential smoothing forecasting
# Create a time series object using the Close price
ts_data <- ts(Google_Stock_Price_Train$Close, start = c(1), frequency = 1)
# Perform exponential smoothing forecasting without seasonal component
es_forecast <- forecast(ets(ts_data, model = "AAN"), h = 3)
plot(es_forecast, main = "Exponential Smoothing Forecast")


# ARIMA model forecasting
arima_forecast <- forecast(auto.arima(ts_data), h = 3)
plot(arima_forecast, main = "ARIMA Model Forecast")





# Fit a linear regression model
model <- lm(Close ~ Open + High + Low + Volume, data =Google_Stock_Price_Train)

# Generate predictions
predictions <- predict(model, Google_Stock_Price_Train)

# Plot actual vs. predicted values
plot(Google_Stock_Price_Train$Date, Google_Stock_Price_Train$Close, type = "l", col = "blue", ylim = range(c(Google_Stock_Price_Train$Close, predictions)), 
     xlab = "Date", ylab = "Close Price")
lines(Google_Stock_Price_Train$Date, predictions, col = "red")


# Fit the ETS model
ets_model <- ets(ts_data)

# Generate forecasts
forecast_ets <- forecast(ets_model, h = 3)  # Adjust h as needed for the number of forecasts

# Plot the original data and forecasts
plot(forecast_ets, main = "Forecast using ETS Model", xlab = "Date", ylab = "Close Price")
lines(ts_data, col = "blue")  # Add original data
