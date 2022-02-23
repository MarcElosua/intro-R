## Brown lab Learning R: Session 1
## February 24, 2022
## Marc Elosua Bayes

################################################################################
## Part I: The Basics
################################################################################

# Math! + - * / ^
# You can use R like a basic calculator
1 + 1

#################
#### Objects ####
#################
# To create objects, we use the assignment operator: <-
x <- 2
x

y <- "hello"

z <- TRUE
z <- 2 > 3

###################
#### Functions ####
###################
# Functions always follow this format: function(arg1, arg2, arg3)
print(y)
sum(2, 3)

# Sometimes you might want to name your arguments
seq(from = 1, to = 10, by = 1)

?seq

# Objects can have different classes:
class(x)
class(1.5)
class("hello")

# Objects can have different lengths
x <- seq(10)
x

#################
#### Vectors ####
#################

# Vectors (objects with length > 1)
# c() (concatenate) is how you make a vector
x <- c("Where", "are", "my", "mice?")

y <- c(1, 2, 3)

# You can subset vectors using brackets
y[2]

# While we're here, sequences:
y <- 1:3

# You can add onto vectors
y <- c(y, 7)
y

##################
#### Exercise ####
##################

# Create a vector called "my_values" with two values:
# 1: the mean of numbers 10 through 23,
# 2: the square-root of 317

#####################
#### Data-frames ####
#####################
# A dataframe is like a single sheet in a spreadsheet
# We'll start using mtcars, which is a built in data-set
mtcars

# To reference a columm, you'll use the dollar sign
mtcars$carb

###################
#### For loops ####
###################

for (i in 1:5) {
    print(i)
}

x <- c("Where", "are", "my", "mice?")
for (i in x) {
    print(i)
}

# If statements
x <- 3
if (x < 2) {
    print("x is less than 2")
} else {
    print("x is more than 2")
}

###################
#### Functions ####
###################
foo <- function(x) {
    x + 2
}

# What happens if we pass an integer
foo(5)

# What happens if we pass a number
foo(3.5)

# What happens if we pass a string
foo("Hello")

####################
#### Exercise-2 ####
####################

## Write a function that does some basic math with two arguments
foo2 <- function(x, y){
    # Cheat skeleton here
}

## Write a function that takes in a vector, multiplies it by 2,
## and then returns the first 2 arguments

## Write a function that:
# multiples the input by 3 if it's less than 5,
# and divides the input by 2 if it's >= 5

# Remember the if {} else {} we used before
if (3 == 3) {
    print("Three Equals Three!")
}
