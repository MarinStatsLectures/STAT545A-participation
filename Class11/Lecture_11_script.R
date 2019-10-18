# were going to write data to disk

# first, let's load the gapminder data and the tidyverse library
library("gapminder")
library("tidyverse")

gapminder

# write to file
write_csv(x=gapminder, path="./gapminder.csv")

# to take a look at the data
View(gapminder)

gapminder_summ <- gapminder %>%
  group_by(continent) %>%
  summarize(avg_lifeExp = mean(lifeExp))

View(gapminder_summ)

# write that to file
write_csv(x=gapminder_summ, path="./gapminder_summ.csv")

# read it back in...
gap_csv <- read_csv("./gapminder_summ.csv")

####

# let's install the "here here" package, for setting W.D.
install.packages("here")
library("here")

# what's in R's memory?
ls()

# how to use the "here" package...
read_csv(here::here("test", "tes", "te", "t", "gapminder_summ.csv"))

# writing to file
write_csv(gapminder_summ, here::here("gapminder_sum.csv"))

# read about the "here" package...here
#   https://cran.r-project.org/web/packages/here/index.html


# this is the URL for the greatest givers dataset
# http://gattonweb.uky.edu/sheather/book/docs/datasets/GreatestGivers.xls

##
#### GREATEST GIVERS DATA
##

data_url <- "http://gattonweb.uky.edu/sheather/book/docs/datasets/GreatestGivers.xls"

# extract the file name from the URL
file_name <- basename(data_url)
# check that
file_name


# read CSV can directly import URLs but read_excel requires 
# you to first downlaod the data

download.file(url=data_url, destfile = paste("./dataasets", 
                                             file_name))

# Task: change above to use the "here::here" package
download.file(url=data_url, destfile = 
                here::here("GreatestGivers.xls"))

## recommendation, use "basename" - it takes the entire URL and 
##   extracts the final file name from a URL
download.file(url=data_url, destfile = 
                here::here(file_name))

# now let's read in the file...
library(readxl)
# read it in and assign to philan...  note that trim_ws trims off
# the white space...awesome!
philanthropists <- read_excel(here::here(file_name), trim_ws=TRUE)
# look at it
View(philanthropists)

# take a look at just the beginning..
head(philanthropists)


##
#### NOW, the FIRAS data
##

mri_file <- here::here("Firas-MRI.xlsx")

# read in the data, and select the range
mri <- read_excel(mri_file, range="A1:L12")
# and remove column 10
mri <- mri[, -10]
View(mri)

# this data is in wide format, we need to convert to long format
mri <- mri %>%
  pivot_longer(cols="Slice 1":"Slice 8", 
               names_to = "slice_num", 
               values_to = "value")
View(mri)
