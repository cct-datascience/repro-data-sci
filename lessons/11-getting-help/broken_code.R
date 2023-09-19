library(palmerpenguins)
library(dplyr)
penguins |> 
  mutate(body_mass_kg = body_mass_g / 1000) |> 
  select(island == "Torgersen")
