#### Preamble ####
# Purpose: Simulates a dataset
# Author: Yihang Xu
# Date: 3 Dec 2024
# Contact: joker.xu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `oil_in_two_vendors` rproj


#### Workspace setup ####
library(tidyverse)
set.seed(1008819744)


#### Simulate data ####
# Vendor names
vendors <- c("TandT","Galleria")

#Generate simulated data
simulated_data <- tibble(
  vendor = sample(vendors, size = 1000, replace = TRUE),
  current_price = round(runif(1000, 1, 50), 3),
  old_price = round(runif(1000, 2, 60), 3),
  month = sample(6:12, size = 1000, replace = TRUE)
)

#### Save data ####
write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")
