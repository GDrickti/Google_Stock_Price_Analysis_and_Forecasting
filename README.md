# Google Stock Price Analysis and Forecasting

This repository contains R code to analyze and forecast Google stock price data. The code performs various analyses and utilizes different forecasting techniques.

## Description

The R code provided in this repository performs the following tasks:

1. **Data Import and Exploration**: 
    - Reads the Google Stock Price Train data from a CSV file.
    - Displays the structure and summary statistics of the dataset.
    - Visualizes the data using histograms, scatter plots, and boxplots.

2. **Moving Average Forecasting**:
    - Calculates the Moving Average of the closing prices and plots it against the original data.

3. **Exponential Smoothing Forecasting**:
    - Performs exponential smoothing forecasting without seasonal components using the `forecast` package.
    - Plots the forecasted values.

4. **ARIMA Model Forecasting**:
    - Fits an ARIMA model to the time series data using the `auto.arima` function.
    - Generates forecasts using the fitted ARIMA model and plots the forecasted values.

5. **Linear Regression Analysis**:
    - Fits a linear regression model to predict the closing prices based on other variables (Open, High, Low, Volume).
    - Generates predictions using the linear regression model and plots the actual vs. predicted values.

6. **ETS Model Forecasting**:
    - Fits an ETS (Error, Trend, Seasonality) model to the time series data.
    - Generates forecasts using the fitted ETS model and plots the forecasted values.

## Requirements

To run the code in this repository, you need:

- R programming environment installed.
- Required packages: `readr`, `forecast`, `TTR`, `ggplot2`.

## Usage

1. Clone this repository to your local machine.
2. Set the working directory in R to the location of the cloned repository.
3. Run the R script `Google_Stock_Price_Analysis.R` in your R environment.
## Histogram 
![histogram](https://github.com/GDrickti/Google_Stock_Price_Analysis_and_Forecasting/assets/89154452/fcbdfb7a-4c7e-42a4-8df5-0c9927dc3b26)
