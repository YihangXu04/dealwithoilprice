#### Preamble ####
# Purpose: Draw graphs of the relations of variables
# Author: Yihang Xu
# Date: 3 Dec 2024
# Contact: joker.xu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` and 'arrow' package must be installed and loaded
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Read data ####
analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")

# Ensure month is treated as a factor
analysis_data <- analysis_data %>%
  mutate(month = factor(month, levels = 6:12, labels = month.abb[6:12]))

# Distribution of current_price by vendor
ggplot(analysis_data, aes(x = vendor, y = current_price)) +
  geom_boxplot() +
  labs(
    title = "Distribution of current_price of oil by vendor",
    x = "Vendor",
    y = "current_price"
  ) +
  theme_minimal()

# Distribution of current_price by month
ggplot(analysis_data, aes(x = month, y = current_price)) +
  geom_boxplot() +
  labs(
    title = "Distribution of current_price of oil by month",
    x = "month",
    y = "current_price"
  ) +
  theme_minimal()

# Distribution of current_price by old_price
ggplot(analysis_data, aes(x = old_price, y = current_price)) +
  geom_point() +
  labs(
    title = "Distribution of current_price of oil by old_price",
    x = "old_price",
    y = "current_price"
  ) +
  theme_minimal()


