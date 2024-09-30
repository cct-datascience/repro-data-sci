library(dplyr)
library(tidyr)
library(ggplot2)
library(palmerpenguins)

penguins <- penguins

# Fit a linear model on Biscoe penguins and extract predictions

biscoe <- penguins |>
  filter(island == "Biscoe") |>
  filter(!is.na(sex),
         !is.na(body_mass_g))

biscoe_lm <- lm(body_mass_g ~ sex * species,
                data = biscoe)

summary(biscoe_lm)

biscoe_lm_predictions <-
  biscoe |>
  select(sex, species) |>
  distinct() 

biscoe_lm_predictions <- biscoe_lm_predictions |>
  mutate(predicted = predict(biscoe_lm, newdata = biscoe_lm_predictions))

# How could we break this into a function?

# Use a for loop to apply this function to each island and combine the results.

# Use purrr::map to apply this function to each island and combine the results.