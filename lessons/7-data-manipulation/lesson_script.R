# Create a new branch for this session's work

# Create a new script, call it "06-data-manip.R"

# Install dplyr and tidyr

if(FALSE){
  install.packages("dplyr")
  install.packages("tidyr")
  install.packages("palmerpenguins")
}

library(dplyr)
library(tidyr)
library(palmerpenguins)

# Load data

penguins_data <- penguins

# Create a directory to store the raw data
# Store the raw data there

write.csv(penguins_data, "06-data/data_raw/penguins_data_raw.csv", row.names = F)

#### Tibbles & data frames ####

class(penguins_data) 
# it's a tibble AND a data.frame
# talk about how R stores data in a data.frame
# and that tibbles are specific to the tidyverse 

penguins_data
head(penguins_data)
tail(penguins_data)

str(penguins_data)
# str is useful for tibbles
# note different data types
# note factors
# note presence of NAs

##### Data types #####

# vectors

# integer
flippers <- penguins_data$flipper_length_mm
flippers
mode(flippers)

# numeric
weights <- penguins_data$body_mass_g
weights
mode(weights)

# FACTOR

species <- penguins_data$species
species
mode(species)
class(species)

# character

species_chr <- as.character(penguins_data$species)
species_chr
mode(species_chr)
class(species_chr)

# talk about, maybe demo logical

# create vectors
# show that vectors must be all one type
# show that R will convert to chr if mixed

##### Operations on vectors #####

# show summary-style operations
mean(penguins_data$year)

# show vectorized operations

paste("Year: ", penguins_data$year)

##### Missing data #####

# introduce concept of NA
# demo performing operation on a column with NAs
# demo na.rm = T

mean(penguins_data$bill_length_mm)
mean(penguins_data$bill_length_mm, na.rm = T)

#### Data manipulation #### 

##### Subsetting and filtering data #####

##### Assignment and pipes #####

##### Adding columns (mutate) #####

##### Split-apply-combine #####

##### Reshaping #####

#### Optional: advanced topics ####

##### reprex #####

##### joins + advanced joins #####

#### Modify - add - commit ####

# adds penguins + penguins_long to repo
# commit and push

#### Palmer penguins citation ####
citation("palmerpenguins")
