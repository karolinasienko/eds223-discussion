## EDS 223 - Lab 0: Data Wrangling Refresher


# Packages ---------------------------------------------------------------

packages <- c("here", "janitor", "tidyverse", "sf", "terra", "tmap", "spData", "geodata", "kableExtra", "viridisLite")
installed_packages <- packages %in% rownames(installed.packages())

install.packages("spDataLarge", repos = c("https://geocompx.r-universe.dev", "https://cloud.r-project.org"))

if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

library(here)
library(janitor)
library(tidyverse)
library(sf)
library(kableExtra)



# Load Data --------------------------------------------------------------

gdw_df <- read_csv(here("data", "gdw.csv")) |>
  clean_names() # Convert variable names to lower snake case



# Data Exploration -------------------------------------------------------

# Showing the first and last 10 rows
head(gdw_df, n = 10) |> 
  kable() # making nice HTML table

tail(gdw_df, n = 10) |> 
  kable() #making nice HTML table

# Printing number of rows and cols
dim(gdw_df)
nrow(gdw_df)
ncol(gdw_df)

# Printing col names
names(gdw_df)


# Index, Summarize, Subset Data ------------------------------------------

# Extracting country col as df and vector
country_df <- gdw_df[, "country"]
country_vec <- gdw_df[["country"]]


gdw_df |> 
  group_by(dam_type) |>
  summarise(count = n()) |>
  ungroup()




