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

surveys_complete %>%
  group_by(species, stat_week_sun_sat, wria) %>%
  summarize(mean_fork_length = mean(fork_length_cm)) %>%
  ggplot(aes(x = stat_week_sun_sat, y = mean_fork_length,
             color = species)) + 
  geom_line() +
  facet_grid(rows = vars(species), cols = vars(wria)) + 
  #facet_wrap(vars(species,wria))
theme_minimal() +
scale_color_manual(name = "Species",
                   values = c("blue","orange", "green"))

# change species order
surveys_complete$species <- factor(surveys_complete$species,
                           levels = c("Coho","Chum","Chinook"),
                           ordered = TRUE)


# Customize plots
ggplot(data = yearly_sex_counts, 
       aes(x = stat_week_sun_sat, y = n, color = sex)) +
    geom_line() +
  facet_wrap(vars(species)) +
  labs(title = "Salmon Returns Through Time",
       x = "Stat Week",
       y = "Number of Fish Surveyed")+
    theme_bw() +
   theme(axis.text.x = element_text(colour="red",
                                    size =20, angle = 90,
                                    hjust = 0.5, vjust = 0.5),
         axis.text.y = element_text(colour = "blue", size = 12),
         strip.text = element_text(face = "italic"),
         plot.title = element_text(hjust =0.1))

custom_theme <-  theme(axis.text.x = element_text(colour="red",
                                                  size =20, angle = 90,
                                                  hjust = 0.5, vjust = 0.5),
                       axis.text.y = element_text(colour = "blue", size = 12),
                       strip.text = element_text(face = "italic"),
                       plot.title = element_text(hjust =0.1))

ggplot(data = yearly_sex_counts, 
       aes(x = stat_week_sun_sat, y = n, color = sex)) +
  geom_line() +
  facet_wrap(vars(species)) +
  labs(title = "Salmon Returns Through Time",
       x = "Stat Week",
       y = "Number of Fish Surveyed")+
 # theme_bw() +
  custom_theme

class(custom_theme)
save(custom_theme, file="custom_theme.Rdata")
load(file = "custom_theme.Rdata")

# Export plots
plot_fork <- ggplot(surveys_complete,
                    aes(x= species, y = fork_length_cm)) +
  geom_boxplot()
plot_stat_week <- ggplot(data = yearly_sex_counts,
                         aes(x= stat_week_sun_sat, y =n)) +
  geom_line()
library(ggpubr)
combined <- ggarrange(plot_fork, plot_stat_week, 
                      ncol =1, nrow = 2)

# save plot
ggsave("plot_combined.png", 
       combined, width = 10, dpi = 300)


  