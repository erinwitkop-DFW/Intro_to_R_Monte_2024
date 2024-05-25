# WDFW Intro to R for Ecologists Workshop 2024

## General Information

The Montesano Fish Program is conducting it's first Intro to R for Ecologists workshop this June. The workshop is geared towards people who have never programmed or have limited programming experience in R. 

The workshop curriculum will closely mirror this publicly available Data Carpentry workshop ["Data Analysis and Visualization in R for Ecologists"](https://datacarpentry.org/R-ecology-lesson/). However, the course has been shortened and data sets and challenge examples have been tailored to be more applicable to fish program work.

This repository houses the schedule, code, and resources for the workshop.

For more information regarding the mission and purpose of Data Carpentry visit their [website](https://datacarpentry.org). For further reading about the Carpentry approach to teaching scientific computing see their [paper](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005510).

## Details

**When and Where:** The workshop will run for 3 mornings (8 – 12pm), June 5 to 7 in person at the Region 6 Headquarters, 48 Devonshire Rd. Montesano, WA 98563. 

Though we recognize the commitment of a 3 morning workshop, we ask attendees to attend all sessions as the curriculum is designed to progressively build upon skills from prior days. 

Lunch will not be provided, however, multiple options exist around Montesano: 
-   On site - Montesano Office has kitchenette facilities available. Includes: Refrigerator/freezer, microwave, filtered water, water boiling pot, coffee pod unit [bring your own pods].
-   Off site – Subway, Westside Pizza, Gene’s Stop and Go, Wynooche Meats & Deli, Crow’s Nest, Lemon Hill Cafe, Oishi Teriyaki, Beehive Restaurant, Organics 101 Market Deli & Juice Bar, Pick Rite Thriftway Deli, etc.
[Map - Food in Montesano, WA](https://www.google.com/search?q=food+near+Montesano%2C+WA&sca_esv=1a58b9be7c98827f&rlz=1C1GCFJ_enUS1087US1088&sxsrf=ADLYWILWFpm9n7BNIKJQfbt7ASRFnqXJOg%3A1715716625160&ei=EcJDZsm2Cej00PEP7uquOA&oq=food+near+me&gs_lp=Egxnd3Mtd2l6LXNlcnAiDGZvb2QgbmVhciBtZSoCCAAyChAAGLADGNYEGEcyChAAGLADGNYEGEcyChAAGLADGNYEGEcyChAAGLADGNYEGEcyChAAGLADGNYEGEcyChAAGLADGNYEGEcyChAAGLADGNYEGEcyChAAGLADGNYEGEcyDRAAGIAEGLADGEMYigUyDRAAGIAEGLADGEMYigUyDRAAGIAEGLADGEMYigUyDRAAGIAEGLADGEMYigUyGRAuGIAEGLADGNEDGEMYxwEYyAMYigXYAQEyGRAuGIAEGLADGNEDGEMYxwEYyAMYigXYAQEyGRAuGIAEGLADGNEDGEMYxwEYyAMYigXYAQEyGRAuGIAEGLADGNEDGEMYxwEYyAMYigXYAQEyGRAuGIAEGLADGNEDGEMYxwEYyAMYigXYAQEyGRAuGIAEGLADGNEDGEMYxwEYyAMYigXYAQFIixdQAFgAcAF4AZABAJgBAKABAKoBALgBAcgBAJgCAaACCJgDAIgGAZAGEroGBggBEAEYCJIHATGgBwA&sclient=gws-wiz-serp)


**Requirements:** Participants must bring a personal or WDFW provided laptop with both recent versions of R and RStudio downloaded, as well as the specific software packages listed below. For any questions or issues regarding installing software on agency devices please contact Ryan Hilleary <ryan.hilleary@dfw.wa.gov> in IT for assistance. 

**Contact**: Please contact Erin Witkop <erin.witkop@dfw.wa.gov> for any questions regarding the schedule, location, or curriculum.

**Price**: The workshop is FREE.


## Before the Workshop

1. Make sure R and RStudio are installed on your machine. Follow the instructions [here](https://datacarpentry.org/R-ecology-lesson/#Install_R_and_RStudio) if you are downloading onto your personal machine. If you are downloading onto a WDFW machine, we will be working with you and IT to download this software.

    - Note R must be installed prior to installing and using RStudio.
    - For issues installing software on agency devices please contact Ryan Hilleary <ryan.hilleary@dfw.wa.gov> in IT for assistance.

3. Install necessary packages.

    **NOTE:** The time required to dowload and install packages can vary. Please download and install these packages prior to the workshop starting!

    During the course we will need a number of R packages. Packages contain useful R code written by other people.

    To install these packages, open RStudio (after R is installed) and copy and paste the following command into the console window (look for a blinking cursor on the bottom left), then press Enter (Windows and Linux) or Return (MacOS) to execute the command.

            
            install.packages(c("tidyverse","ggpubr", "lubridate"))
        

    Alternatively, you can install the packages using RStudio’s graphical user interface by going to `Tools > Install Packages` and typing the names of the packages separated by a comma. When the installation has finished, you can try to load the packages by pasting the following code into the console and pressing `run` on the top right of the screen:

            
             library(tidyverse)
             library(ggpubr)
             library(lubridate)

            
    If you do not see an error like `there is no package called ‘...’` you are good to go!

## Download the Data

Download this data [here](https://github.com/erinwitkop-DFW/Intro_to_R_Monte_2024/blob/main/Data/FTS_Carcass_1969_2024.xlsx). This is the carcass data for all available WRIA's in the FTS databased from 1969-2024.

## Collaborative Notes

We will use this public, collaborative [document](https://pad.riseup.net/p/Intro_R_Monte_2024) for chatting, taking notes, and sharing URLs and bits of code during the workshop. This collaborative document will expire 60 days from it's creation.

## Schedule

NOTE: This precise timing of the schedule is still being adjusted - stay tuned for updates.

### DAY 1: June 5th

| Time           | Topic                                            | Data Carpentry Curriculum Reference                                                                  |
|:---------------|:------------------------------------------------:|:----------------------------------------------------------------------------------------------------:|
| 7:30am         |Pre-Workshop Help                                 |                                                                                                      |
| 8:00am         |Official Workshop Start/Introduction              | <https://datacarpentry.org/R-ecology-lesson/00-before-we-start.html>                                 |
| 8:10am         |Introduction to R                                 | <https://datacarpentry.org/R-ecology-lesson/00-before-we-start.html#Knowing_your_way_around_RStudio> |
| 9:30am-9:45am|BREAK                                             |                                                                                                      |
| 9:45am-10:15am|Starting with Data in R (dataframes)              | <https://datacarpentry.org/R-ecology-lesson/02-starting-with-data.html>                              |
| 10:15am-11:00am|Starting with Data in R Cont. (factors)           |                                                                                                      |
| 11:00am-11:15am        |BREAK                                     |                                                                                                      |
|11:15am-12:00pm  | Manipulating Data in R   | <https://datacarpentry.org/R-ecology-lesson/03-dplyr.html#Pipes>  


### DAY2: June 6th

| Time           | Topic                                            | Data Carpentry Curriculum Reference                                                                  |
|:---------------|:------------------------------------------------:|:----------------------------------------------------------------------------------------------------:|
| 8:00am         |Manipulating Data and working with Dates  | <https://datacarpentry.org/R-ecology-lesson/03-dplyr.html#Pipes>                                     |
| 10:15am-10:30am|BREAK                                             |                                                                                                      |
| 10:30am-12:00pm|Visualizing Data (ggplot)                         | <https://datacarpentry.org/R-ecology-lesson/04-visualization-ggplot2.html>                           |
| 12:00pm        |End of Day 2                                      |                                                                                                      |

### DAY 3: June 7th

| Time           | Topic                                                       | Data Carpentry Curriculum Reference                                                                  |
|:---------------|:-----------------------------------------------------------:|:----------------------------------------------------------------------------------------------------:|
| 8:00am         |Visualizing Data Continued (pipes, faceting, themes)         | <https://datacarpentry.org/R-ecology-lesson/04-visualization-ggplot2.html>                           |
| 10:15am-10:30am|BREAK                                                        |                                                                                                      |
| 10:30am-12:00pm|Visualizing Data Cont. (customization, arranging, exporting) | <https://datacarpentry.org/R-ecology-lesson/04-visualization-ggplot2.html>                           |
| 12:00pm        |End of Day 3                                                 |                                                                                                      |
