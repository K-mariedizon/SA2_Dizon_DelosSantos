# Load necessary libraries
library(tidyverse)

# Read Ethereum returns data from CSV file
eth_data <- read_csv("path/to/ethereum_data.csv")

# Assuming the CSV file has columns like 'timestamp' and 'close'
# Calculate returns
eth_returns <- eth_data %>%
  mutate(returns = (close - lag(close)) / lag(close)) %>%
  na.omit() %>%
  pull(returns)

# Perform Shapiro-Wilk normality test
shapiro_test <- shapiro.test(eth_returns)

# Plot histogram of returns
hist(eth_returns, main = "Histogram of Ethereum Returns", xlab = "Returns", ylab = "Frequency")

# Plot Q-Q plot of returns
qqnorm(eth_returns)
qqline(eth_returns, col = 2)

# Display test results
print("Shapiro-Wilk Normality Test Results:")
print(shapiro_test)
