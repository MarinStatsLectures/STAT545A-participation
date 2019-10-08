# This is some data exploration for STAT 545

# here is a bit, for demonstration

##########
### 2.5.1 
#########

# add 2 munbers
2+3


# store in X and Y, then do some artihmetic
x <- 10
y <- 3

# and here is the arithmetic
x/y
x*y
(x>y)
(2*y>x)
(4*y>x)
as.numeric(4*y>x)

# and here's what happens when a variable hasnt been defined
x*a

# im quite comfortable with R (it is GitHub, RMarkdown, etc
# that i want to learn about, so im just including a bit
# here for the sake of completing class exercises)

#########
### 2.5.2 
#########

# this is the "times" exercise...i wasnt at class, so im 
# making up my own values
times <- c(40,45,30,60)
times

# convert that to hours (assuming that times is in minutes)
times.hours <- times/60
times.hours

#########
### 2.5.3 
#########

# calculate mean, range, and other summaries for "times"
mean(times)
range(times)
quantile(times, p=0.75)

#########
### 2.5.4 
#########

# use some logic statements

# is a time less than 47 minutes?
times
(times<47)

# is a time equal to 40?
times
(times==40)
# and code that as a 0/1
as.factor(as.numeric(times==40))

# and looking at the "which", "any", "all" statements
# first, lets see the times and if they are <47
times
(times<47)
which(times<47)
any(times<47)
all(times<47)
# these answer which are <47, if any <47, and if all<47

#########
### 2.5.5 
#########

# some examples of using []

# extract the 3rd element
times[3]

# extract all but the 3rd
times[-3]

# extract the 1,2,4
times[c(1,2,4)]

# extract 2 to 4 using :
times[2:4]

# extract all times <47
times[times<47]


# replace element 1 with 20
times
times[1] <- 20
times

# cap values...anything larger that 50 is replaced with 51
times
times[times>50] <- 51
times

# revise time by removing the 2nd element
times
times <- times[-2]
times

#########
### 2.5.7
#########

# dealing with NAs

# lets add an "NA" as the final element in our vector of times
times
times <- c(times, NA)
times

# calculate the mean
mean(times)
# whoops, we have to address the NA...
mean(times, na.rm=T)
# but, do we realyl want to just remove an NA??


#########
### 2.5.8
#########

# dataframes...

# load the mtcars data
print(mtcars)

# check out some of those commands
head(mtcars)
tail(mtcars)
str(mtcars)  # note "vs" and "am" are factors, not numeric
nrow(mtcars)
ncol(mtcars)
summary(mtcars)
row.names(mtcars)
names(mtcars)

# whats the first col name?
names(mtcars)[1]

# which col is "vs"?
which(names(mtcars)=="vs")

# calculate mean mpg
mean(mtcars$mpg)

# install the "tibbles" and "gapminder" packages
#install.packages("tibble")
#install.packages("gapminder")

# load the libraries
library(tibble)
library(gapminder)

# let's explore "tibbles"
?tibble
browseVignettes(package = "tibble")

# print out the gapminder tibble
gapminder
# main differences i see as that it is abbriged, and that
# it gives a top row telling if it is factor/integer,..