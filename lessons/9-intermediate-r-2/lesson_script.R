library(dplyr)
library(palmerpenguins)

### Iteration with  for loops

#### Basic iteration
for(i in 1:10) {
  print(i)
}

#### Operation
for(i in 1:10) {
  print(i^2)
}

#### Iteration just needs a vector
for(letter in c("a", "b", "c")) {
  print(letter)
}

#### Iteration to modify things
my_vector <- 1:10

for(i in 1:length(my_vector)) {
  my_vector[i] <- my_vector[i]^2
}

# Note this can be slow and isn't preferred unless it's your only option!


### Iteration with purrr

library(purrr)

purrr::map(1:10, \(x) x)

purrr::map(1:10, \(x) x^2)


### Iteration with more complex workflows

#### For loop

for(an_island in c("Biscoe", "Dream")) {
  
  island_data <- filter(penguins,
                        island == an_island)
  
  print(summary(lm(bill_length_mm ~ species, data = island_data)))
  
}

# Store output in a list

island_lms <- list()

for(an_island in c("Biscoe", "Dream")) {
  
  island_data <- filter(penguins,
                        island == an_island)
  
  island_lms[[an_island]] <- summary(lm(bill_length_mm ~ species, data = island_data))

}

#### purrr


### purrr cheatsheet: https://github.com/rstudio/cheatsheets/blob/main/purrr.pdf

### Organizing a script

#### Packages at the top (dplyr, stringr, purrr)
#### Section for functions OR a separate script + source
#### Short, clean lines for executing actual analysis



