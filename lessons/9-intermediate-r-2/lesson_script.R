library(dplyr)

### Copy this from Tuesday's script

my_function <-
  function(data_url = "https://github.com/cct-datascience/repro-data-sci/raw/r-lessons/lessons/7-intermediate-r-1/lesson-data/Biscoe.csv") {
    island_dat <- read.csv(data_url)
    
    
    island_dat <- island_dat |>
      na.omit()
    
    
    island_dat_means <- island_dat |>
      group_by(species, sex) |>
      summarize(across(ends_with("mm") | ends_with("g"), mean))
    
    island_dat_means_imperial <- island_dat_means |>
      mutate(
        across(ends_with("mm"), ~ . * 0.03937008, .names = "{.col}_in"),
        across(ends_with("g"), ~ . * 0.002204623, .names = "{.col}_lb")
      )
    
    island_dat_means_imperial <- island_dat_means_imperial |>
      rename_with( ~ stringr::str_replace(., "mm_in", "in"), .cols = ends_with("mm_in")) |>
      rename_with( ~ stringr::str_replace(., "g_lb", "lb"), .cols = ends_with("g_lb"))
    
    island_dat_means_imperial <- island_dat_means_imperial |>
      select(c(where(is.character) |
                 ends_with("in")))
    
    
    return(island_dat_means_imperial)
    
  }


### Generalizing

#### Swap in different URLS and make sure they work:

biscoe <- my_function()
torgersen <-
  my_function(
    "https://github.com/cct-datascience/repro-data-sci/raw/r-lessons/lessons/7-intermediate-r-1/lesson-data/Torgersen.csv"
  )
dream <-
  my_function(
    "https://github.com/cct-datascience/repro-data-sci/raw/r-lessons/lessons/7-intermediate-r-1/lesson-data/Dream.csv"
  )

#### Modify my_function to swap the URL based on the input:

my_function2 <- function(island) {
  if (island == "Biscoe") {
    data_url <-
      "https://github.com/cct-datascience/repro-data-sci/raw/r-lessons/lessons/7-intermediate-r-1/lesson-data/Biscoe.csv"
  } else if (island == "Dream") {
    data_url <-
      "https://github.com/cct-datascience/repro-data-sci/raw/r-lessons/lessons/7-intermediate-r-1/lesson-data/Dream.csv"
  } else if (island == "Torgersen") {
    data_url <-
      "https://github.com/cct-datascience/repro-data-sci/raw/r-lessons/lessons/7-intermediate-r-1/lesson-data/Torgersen.csv"
  } else {
    stop("Unknown island name")
  }
  
  island_dat <- read.csv(data_url)
  
  island_dat <- island_dat |>
    na.omit()
  
  island_dat_means <- island_dat |>
    group_by(species, sex) |>
    summarize(across(ends_with("mm") | ends_with("g"), mean))
  
  island_dat_means_imperial <- island_dat_means |>
    mutate(
      across(ends_with("mm"), ~ . * 0.03937008, .names = "{.col}_in"),
      across(ends_with("g"), ~ . * 0.002204623, .names = "{.col}_lb")
    )
  
  island_dat_means_imperial <- island_dat_means_imperial |>
    rename_with( ~ stringr::str_replace(., "mm_in", "in"), .cols = ends_with("mm_in")) |>
    rename_with( ~ stringr::str_replace(., "g_lb", "lb"), .cols = ends_with("g_lb"))
  
  island_dat_means_imperial <- island_dat_means_imperial |>
    select(c(where(is.character) |
               ends_with("in")))
  
  
  return(island_dat_means_imperial)
  
}


biscoe <- my_function2("Biscoe")
torgersen <- my_function2("Torgersen")
dream <- my_function2("Dream")
oops <- my_function2("Torgerson")


### Iteration 1: for loops

islands <- c("Biscoe", "Torgersen", "Dream")

clean_island_dat <- list()

for(i in 1:length(islands)) {
  
  clean_island_dat[[i]] <- my_function2(islands[i])
  
}

clean_island_dat <- list()

for(island_name in islands) {
  
  clean_island_dat[[island_name]] <- my_function2(island_name)
  
}

all_cleaned_dat <- bind_rows(clean_island_dat, .id = "island")

### Iteration 2: purrr

library(purrr)

purr_island_dat <- map(islands, my_function2) 

purr_island_dat <- purr_island_dat |>
  set_names(islands)

### Using purrr for a longer workflow (show, don't expect to transfer)

purr_lms <- purr_island_dat |>
  map(\(df) lm(bill_depth_in ~ flipper_length_in, data = df)) |>
  map(anova)

purr_lms_table <- bind_rows(purr_lms, .id = "island")

### purrr cheatsheet: https://github.com/rstudio/cheatsheets/blob/main/purrr.pdf

### Organizing a script

#### Packages at the top (dplyr, stringr, purrr)
#### Section for functions OR a separate script + source
#### Short, clean lines for executing actual analysis



