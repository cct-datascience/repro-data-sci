library(dplyr)

island_dat <- read.csv("https://github.com/cct-datascience/repro-data-sci/raw/r-lessons/lessons/7-intermediate-r-1/lesson-data/Biscoe.csv")

head(island_dat)

# Write a cleaning/wrangling script...
# first do a mutate to change just flipper length
# then do mutate(ends_with = "mm")

### Remove NAs

island_dat <- island_dat |>
  na.omit()

### Calculate species-by-sex means for morphological features

species_sex_means <- island_dat |>
  group_by(species, sex) |>
  summarize(across(ends_with("mm") | ends_with("g"), mean))

#### Add number of penguins per group
species_sex_means <- island_dat |>
  group_by(species, sex) |>
  summarize(across(ends_with("mm") | ends_with("g"), mean),
            n_penguins = dplyr::n())

### Convert units from metric to imperial

species_sex_means_imperial <- species_sex_means |>
  mutate(across(ends_with("mm"), ~ . * 0.03937008, .names = "{.col}_in"), 
         across(ends_with("g"), ~ . * 0.002204623, .names = "{.col}_lb" ))

#### Rename columns 

species_sex_means_imperial <- species_sex_means_imperial |>
  rename_with(~stringr::str_replace(., "mm_in", "in"), .cols = ends_with("mm_in")) |>
  rename_with(~stringr::str_replace(., "g_lb", "lb"), .cols = ends_with("g_lb"))

#### Select variables

species_sex_means_imperial <- species_sex_means_imperial |>
  select(c("n_penguins",
           where(is.character) |
           ends_with("in") |
           ends_with("lb")))

### Produce crosstabs

library(tidyr)

species_by_sex_crosstabs <- species_by_sex_means |>
  pivot_wider(id_cols = species, names_from = sex, values_from = where(is.numeric))

### Save files

write.csv(species_by_sex_means, "long_means_biscoe.csv")
write.csv(species_by_sex_crosstabs, "crosstabs_biscoe.csv")


## then turn these into functions

## start with one big function

## then break into 3 (or 4): read data; clean data; get species means; change units; get crosstabs; save file.
## then write a script chaining them together
## then separate into functions.R and script.R
## then run on Biscoe again to reproduce.
## use ifelse to switch between island names.