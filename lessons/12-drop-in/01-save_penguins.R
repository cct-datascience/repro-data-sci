library(palmerpenguins)

penguins <- penguins

write.csv(penguins, here::here("multi_language_bash", "penguins_dat.csv"))

print('Saved penguins_dat.csv')