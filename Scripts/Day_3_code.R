# Day 3! :) 

# load packages
library(tidyverse)
library(ggpubr)

# import data
surveys_complete <- read_csv("Data_export/surveys_complete.csv")

# ggplot structure
ggplot(data = X, mapping = aes(x =  , y = .....)) + 
  geom_function() +
  theme()+
  labs()

# first plot!
surveys_plot <- ggplot(data = surveys_complete,
       mapping = aes(x = species, y = fork_length_cm)) 

surveys_plot + 
  geom_point(alpha = 0.1, aes(color = fin_clip) )

# Challenge
# use what you learned to create a scatter plot of 
# fork_length_cm over stat_week_sun_sat, with the sex 
# in different colors

ggplot(data = surveys_complete, 
       mapping = aes( x = species, 
                      y = fork_length_cm)) + 
  geom_jitter(alpha = 0.3) +
# geom_boxplot(outlier.shape = NA) 
  geom_violin() +
  scale_y_log10()

# time series data
# counts per year for each wria
year_week_counts <- surveys_complete %>%
  count(run_year, stat_week_sun_sat, wria)

# timeseries
ggplot(data = year_week_counts, 
       mapping = aes(x = stat_week_sun_sat, y = n,
                     color = run_year)) +
  geom_line()

head(year_week_counts)

# factor run_year
year_week_counts$ run_year <- 
  factor(year_week_counts$run_year)

ggplot(data = year_week_counts, 
       aes(x= stat_week_sun_sat, y = n,
       color = run_year)) +
       geom_line()

# incorporating pipes
year_week_counts %>%
  ggplot(aes(x = stat_week_sun_sat, y = n,
             color = run_year) ) +
  geom_line()

surveys_complete %>%
  count(run_year, stat_week_sun_sat, wria) %>%
  ggplot(aes(x = stat_week_sun_sat, y = n,
             color = run_year) ) +
  geom_line()
  
# facetting
ggplot(data = year_week_counts,
       aes(x = stat_week_sun_sat, y = n )) +
  geom_line() +
  facet_wrap(facets = vars(run_year))

yearly_sex_counts <- surveys_complete %>%
  count(run_year, species, sex, stat_week_sun_sat)
head(yearly_sex_counts)

# facet by species, color by sex
ggplot(data = yearly_sex_counts,
       aes(x=stat_week_sun_sat, y = n, color = sex)) +
    geom_line() +
    #facet_wrap(facets = vars(species))
    facet_grid(rows = vars(sex)) + 
               #cols = vars(species))
  theme_minimal()




  