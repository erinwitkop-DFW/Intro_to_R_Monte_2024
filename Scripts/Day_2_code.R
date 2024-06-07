#Converting factors

sex <- factor(c("male","female","female"))
as.character(sex) # convert to character

year_fct <- factor(c(1990,1983,1997))
as.numeric(year_fct)

# rename factors
plot(surveys$sex)
class(surveys$sex)
surveys$sex <- factor(surveys$sex)
plot(surveys$sex)
# rename factor
levels(surveys$sex)
levels(surveys$sex)[4] <- "Undetermined"
levels(surveys$sex)
plot(surveys$sex)

# Dplyr  and tidyr
select(surveys, species, run)
select(surveys,  -fish_encounter_id)

# filter
filter(surveys, run_year == 2022)
filter(surveys, run_year != 2022)
filter(surveys, fish_count < 5)

# pipes
surveys %>%
  filter(fish_count <5) %>%
  select(species, sex, fish_count)

# Challenge
# using pipes, subset the surveys data
# to include surveys conducted on Chinook
# and retain only the columns 
# Upper_river_mile and lower_river_mile

#
levels(as.factor(surveys$species))

trout <- c("Bull trout",
           "Coastal cutthroat trout")
surveys %>%
  filter(species %in% trout)

# Mutate
class(surveys$fork_length_cm)
surveys$fork_length_cm <-
  as.numeric(surveys$fork_length_cm)
surveys %>%
  mutate(fork_length_m = fork_length_cm/100) %>%
  select(fork_length_m)

# filter NAs
surveys %>%
  filter(!is.na(fork_length_cm)) %>% 
  mutate(fork_length_m = fork_length_cm/100,
         fork_length_in = fork_length_m * 39.37 ) %>%
  select(fork_length_m, fork_length_in)

# Challenge

# Split-apply-combine
surveys %>%
  group_by(species) %>%
  summarize(mean_fork_length = 
              mean(fork_length_cm, na.rm = TRUE))

# Group by multiple criteria
surveys %>%
  filter(!is.na(fork_length_cm)) %>% 
  filter(fork_length_cm !=0 & fork_length_cm > 5) %>%
  group_by(species,sex) %>%
  summarize(
    mean_fork_length = mean(fork_length_cm, na.rm = TRUE),
    min_fork_length = min(fork_length_cm)) %>%
   arrange(desc(min_fork_length))

surveys %>%
  filter(fork_length_cm != 0) %>%
  select(create_user, fork_length_cm)

# Counting observations 
surveys %>%
  count(sex, sort = TRUE)

surveys %>%
  group_by(run_year, wria) %>%
  summarize(count = n())

surveys %>%
  group_by(sex) %>%
  summarize(sum_fish = sum(fish_count))

# Challenge
# How many surveys were conducted each run_year in each wria

surveys %>%
 # group_by(run_year, wria, sex) %>%
  count(run_year, wria)

# Challenge 
#Use `group_by()` and `summarize()` to find the mean, min, 
#and max fish_count for each species (using `species`). 
#Also add the number of observations (hint: see `?n`).
# hint: there are NAs in fish species

surveys %>% 
  filter(!is.na(fish_counts)) %>%
  group_by(species) %>% 
  summarize(mean_count = mean(fish_count),
            min_count = min(fish_count),
            max_count = max(fish_count),
            observations = n())
  
# Wide to Long

#tidy data
#1. Each variable has its own column
#2. Each observation has its own row
#3. Each value must have its own cell
#4. Each type of observational unit forms a table

# pivot to wide
surveys_sl <- surveys %>%
  filter(!is.na(fork_length_cm)) %>%
  group_by(wria, species) %>%
  summarize(mean_fork_length = mean(fork_length_cm))

surveys_wide <- surveys_sl %>%
  pivot_wider(names_from = species,
              values_from = mean_fork_length,
              values_fill = 0)

surveys_wide
# Wide to long
survey_long <- surveys_wide %>%
  pivot_longer(cols = -wria, names_to="Species",
               values_to = "mean_fork_length")
survey_long  

# clean up data
surveys_complete <- surveys %>%
  filter(!is.na(fork_length_cm),
         !is.na(run_year),
         !is.na(sex))

# find most common species
species_counts <- surveys_complete %>% 
  count(species) %>%
  filter( n >= 50)

# keep most common
surveys_complete <- surveys_complete %>%
  filter(species %in% species_counts$species)
# export data
write_csv(surveys_complete, 
          file = "Data_export/surveys_complete.csv")      









