 # Day 1 code

# save weight
weight_kg <- 55

# save as pounds
weight_lb <- 2.2 * weight_kg

# challenge 1
mass <- 47.5            # mass?
age  <- 122             # age?
mass <- mass * 2.0      # mass?
age  <- age - 20        # age?
mass_index <- mass/age  # mass_index?

# Square root
weight_kg <- sqrt(10)

# round
round(3.14)

round(3.14, digits = 2) 
round(3.14, 2)
round(digits = 2, x = 3.14)

# Vectors and data types
weights_g <- c(50, 60, 65, 82)
weights_g

animals <- c("mouse", "rat", "dog")
animals

length(weights_g)
length(animals)

class(weights_g)
class(animals)

str(weights_g)

weights_g <- c(weights_g, 90) # add to end
weights_g
weights_g <- c(30, weights_g) 
weights_g

typeof(weights_g)

# Challenge 2 - What will happen?
# use class() to check)
num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

# Subsetting vectors
animals <- c("mouse", "rat", "dog", "cat")
animals[2]
animals[c(3,2)]

# add elements
more_animals <- animals[c(1,2,3,2,1,4)]
more_animals

# Conditional subsetting
weight_g <- c(21,34,39,54,55)
weight_g[c(TRUE, FALSE, FALSE, TRUE, TRUE)]

# Select values 
weight_g > 50
weight_g[weight_g > 50]

# combine tests
weight_g[weight_g > 30 & weight_g != 54]
weight_g[weight_g <= 30 | weight_g == 50]
weight_g[weight_g >= 30 & weight_g == 21]

# search in strings
animals <- c("mouse", "rat", 
             "dog","cat", "cat")
animals[animals == "cat" | animals == "rat"]

# subset with list of strings
animals %in% c("rat","cat","dog","duck", "goat",
               "bird",
               "fish")
unique(animals[animals %in% c("rat", "cat","dog",
                       "duck", "goat","bird", 
                       "fish")])
# Can you figure out why the following
#returns 'TRUE'
"four" > "five" 

# Missing data
heights <- c(2,4,4, NA, 6)
mean(heights)
max(heights)
mean(heights, na.rm =TRUE)
max(heights, na.rm = TRUE)

# extract elements without missing values
heights[!is.na(heights)]
#heights <- na.omit(heights)
heights
class(heights)
heights[complete.cases(heights)]

# Challenge 
# 1. Using this vector of heights in inches
# create a new vector heights_no_na with
# the NAs removed
heights <- c(63, 69, 60, NA, 68, NA, 70)
heights_no_na <- na.omit(heights)
heights_no_na
median(heights_no_na)
length(heights_no_na[heights_no_na > 67])

# 2. use the median() function to calculate median
# 3. Use R to find how many people are taller than 67 inches


#### Intro to Dataframes ####

# Load packages
library(tidyverse)

# Load in the data
library(readxl)
surveys <- read_excel("Data_raw/FTS_Carcass_1969_2024.xlsx")
# surveys <- read_csv("Data_raw/Carcass.csv")
read.csv()

# explore data
head(surveys)
print(surveys)
View(surveys)
tail(surveys)
head(surveys, n = 10)
surveys[2,3]
str(surveys)
view(surveys)

# size
dim(surveys)
nrow(surveys)
ncol(surveys)
# names
names(surveys)
colnames(surveys)
rownames(surveys)

surveys[1,1]

summary(surveys)

# indexing and subsetting
surveys[1] # same as surveys[,1]

# select multiple
surveys[c(1,2,3), c(5,6)]
surveys[1:3, 5:10]

class(surveys[[1]])
class(surveys[1])

# exclude data
ncol(surveys)
ncol(surveys[, -1])

surveys[-(7:nrow(surveys)),]

surveys["species"]
surveys[, "species"]
surveys[["species"]]
surveys$species

# factors
surveys$species <- factor(surveys$species)
summary(surveys$species)

sex <- factor(c("male", "female", "female",
                "male"))
levels(sex)
nlevels(sex)
#reorder factor
sex <- factor(sex, levels=c("male", "female"))
sex

#Challenge 4-1

#1.  Create a `data.frame` (`surveys_200`) containing only the data in
#row 200 of the `surveys` dataset.

#2.  Notice how `nrow()` gave you the number of rows in a `data.frame`?
  
#  -   Use that number to pull out just that last row from the `surveys`
#dataset.
#-   Compare that with what you see as the last row using `tail()` to
#make sure it's meeting expectations.
#-   Pull out that last row using `nrow()` instead of the row number.
#-   Create a new data frame (`surveys_last`) from that last row.

#3.  Use `nrow()` to extract the row that is in the middle of the data
#    frame. Store the content of this row in an object named
#    `surveys_middle`.

#4.  Combine `nrow()` with the `-` notation above to reproduce the
#    behavior of `head(surveys)`, keeping just the first through 6th rows
#    of the surveys dataset.

# Challenge 4-2

#1.  Change the columns `species` and `wria` in the `surveys` data frame
#    into a factor.

#2.  Using the functions you learned before, can you find out...

#-   How many WRIAs are represented in the dataset?
