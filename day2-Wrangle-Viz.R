###################
#### Tidyverse ####
###################

# The tidyverse is an opinionated collection of R packages designed for
# data science. All packages share an underlying design philosophy, grammar, 
# and data structures

# Resource - https://r4ds.had.co.nz/

# install all the packages
# install.packages("tidyverse")
# install.packages("palmerpenguins")
library(tidyverse)
library(palmerpenguins)
https://allisonhorst.github.io/palmerpenguins/
data(package = 'palmerpenguins')

########################
#### Data Wrangling ####
########################
https://www.datanovia.com/en/courses/data-manipulation-in-r/
https://raw.githubusercontent.com/rstudio/cheatsheets/main/data-transformation.pdf

### Data exploration ###
head(penguins)

# Summary of the variables
summary(penguins)

# Summary of just one variable
summary(penguins$bill_length_mm)

### mutate(): Add/create new variables ###
penguins <- mutate(penguins, 
    bill_length_cm = bill_length_mm / 100,
    body_mass_kg = body_mass_g / 100,
    flipper_length_mm_log10 = log10(flipper_length_mm),
    year = as.character(year))

### rename(): Rename columns. ###
# Lets make the dataset portuguese friendly
pinguins <- rename(penguins, 
    especies = species,
    ilha = island,
    ano = year)

### filter(): Pick rows (observations/samples) based on their values ###

# Only select Adelie penguins
filter(penguins, species == "Gentoo")

# Only select Adelie penguins from Torgersen Island
filter(penguins, species == "Chinstrap" & island == "Dream")

# Can we remove those penguins from which we don't have any data?
head(penguins)
penguins2 <- filter(penguins, ! is.na(bill_length_mm))

penguins2 <- filter(penguins, ! is.na(bill_length_mm) & ! is.na(sex))

### select(): Select columns (variables) by their names. ###

# Select all columns except flipper_length_mm_log10

penguins <- select(penguins, -flipper_length_mm_log10)

# Select columns of interest
penguins3 <- select(penguins,
    c(species, island, bill_length_mm, bill_depth_mm))

### arrange(): Reorder the rows. ###

# sort data  by a value in a column

# Ascending
arrange(penguins2, bill_length_mm)

# Descending
arrange(penguins2, desc(bill_length_mm))

# We can also sort by categorical variables
arrange(penguins2, island)

# Or by 2 variables at the same time
arrange(penguins2, island, bill_length_mm)

### summarise(): Compute statistical summaries (e.g., computing the mean or the sum) ###
summarise(penguins2,
    mean_bill_length = mean(bill_length_mm))

summarise(penguins2,
    mean_bill_length_mm = mean(bill_length_mm),
    median_bill_length_mm = median(bill_length_mm),
    sd_bill_length_mm = sd(bill_length_mm))

### Pipe operator %>%  ###
# This operator allows us to concatenate commands one after the other.
# It basically tells the function to grab the previous' output and do
# whatever they do.

# Pseudocode
wakeup(marc)
eat_breakfast(marc)
brush_teeth(marc)
take_subway(mark)

marc %>%
    wakeup() %>%
    eat_breakfast() %>%
    brush_teeth() %>%
    take_subway()

## Putting together what we just did
penguins4 <- penguins %>%
    # Create and modify variables
    mutate( 
        body_mass_kg = body_mass_g / 100,
        year = as.character(year)
        ) %>%
    # Remove body_mass_g since we have it in Kg
    select(-body_mass_g) %>%
    # Filter and keep those roes that don't have NAs
    filter(! is.na(bill_length_mm) & ! is.na(sex)) %>%
    # Arrange by island and weight
    arrange(island, desc(body_mass_kg))

penguins4

# Lastly we can summarize statistics by groups
penguins4 %>%
    group_by(species) %>%
    summarise(
        mean_body_mass_kg = mean(body_mass_kg),
        sd_body_mass_kg = sd(body_mass_kg),
        median_body_mass_kg = mean(body_mass_kg)
    )

#######################
#### Visualization ####
#######################
https://ggplot2-book.org/
https://raw.githubusercontent.com/rstudio/cheatsheets/main/data-visualization.pdf

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
    geom_point()

# We can color each point by their island
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
    geom_point()

# Shape by the island
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, color = species, shape = island)) +
    geom_point(size = 5) +
    theme_light()

# Prettify adding a theme
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
    geom_point() +
    theme_classic()

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
    geom_point() +
    theme_light()

#### Boxplot
ggplot(penguins, aes(x = species, y = body_mass_g, fill = species)) +
    geom_boxplot() +
    theme_classic()

#### Boxplot + Violin plot
ggplot(penguins, aes(x = species, y = body_mass_g, fill = species)) +
    geom_violin() +
    geom_boxplot(alpha = 0.5) +
    theme_classic()

## Pipeing into a ggplot
penguins %>%
    mutate(body_mass_kg = body_mass_g / 1000) %>%
    ggplot(aes(x = species, y = body_mass_kg, fill = species)) +
        geom_violin() +
        geom_boxplot(alpha = 0.5) +
        theme_classic()

## Facetting
penguins %>%
    mutate(body_mass_kg = body_mass_g / 1000) %>%
    ggplot(aes(x = species, y = body_mass_kg, fill = species)) +
    geom_violin() +
    geom_boxplot(alpha = 0.5) +
    facet_wrap(facets = "year") +
    theme_classic()

