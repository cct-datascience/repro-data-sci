library(palmerpenguins)

penguins_table <- penguins

islands <- split(penguins_table, f= penguins_table$island)

for(i in 1:3) {
  
  write.csv(islands[[i]], here::here("lessons", "7-intermediate-r-1", "lesson-data", paste0(islands[[i]]$island[1], ".csv")), row.names = F)
  
}
