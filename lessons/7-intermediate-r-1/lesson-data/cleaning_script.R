library(dplyr)

island_dat <- read.csv("https://github.com/cct-datascience/repro-data-sci/raw/r-lessons/lessons/7-intermediate-r-1/lesson-data/Biscoe.csv")

head(island_dat)

# Write a cleaning/wrangling script...
# first do a mutate to change just flipper length
# then do mutate(ends_with = "mm")

island_dat <- island_dat |>
  mutate(flipper_length_cm_manual = flipper_length_mm / 10)

island_dat <- island_dat |> 
  mutate(across(ends_with("mm"), ~ ./10, .names="{.col}_cm")) |>
  # this next is optional
  rename_with(~stringr::str_replace(., "mm_cm", "cm"), .cols = ends_with("mm_cm")) # this line can be optional

island_dat_clean <- island_dat |>
  select(where(is.character) | ends_with("cm"))

# calculate species-by-sex means

species_by_sex_means <- island_dat_clean |>
  group_by(species, sex) |>
  summarize(across(ends_with("cm"), mean))

species_by_sex_means <- island_dat_clean |>
  group_by(species, sex) |>
  summarize(across(ends_with("cm"), ~mean(.x,na.rm =T)))


island_dat_clean <- island_dat |>
  select(where(is.character) | ends_with("cm")) |>
  na.omit()

species_by_sex_means <- island_dat_clean |>
  group_by(species, sex) |>
  summarize(across(ends_with("cm"), ~mean(.x,na.rm =T)),
            n_penguins = dplyr::n())

# pivot wider to get crosstabs

library(tidyr)

species_by_sex_crosstabs <- species_by_sex_means |>
  pivot_wider(id_cols = species, names_from = sex, values_from = where(is.numeric))

write.csv(species_by_sex_means, "long_means_biscoe.csv")
write.csv(species_by_sex_crosstabs, "crosstabs_biscoe.csv")


## then turn these into functions

## start with one big function

## then break into 3 (or 4): read data; clean data; get species means; get crosstabs; save file.
## then write a script chaining them together
## then separate into functions.R and script.R

## at this moment I'm unsure how to pivot from this to control flow...
## maybe when we go to make the function, use if else to get URL and name the files?

