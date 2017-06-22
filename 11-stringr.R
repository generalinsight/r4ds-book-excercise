library(tidyverse)
library(stringr)


x <- c("\"", "\\")
x
writeLines(x)
?"'"

x<- "\u00b5"
x

str_length(x)
str_c("x","y")
str_c("x","y", sep = ", ")
str_c("prefix-", c("a","b","c"), "-suffix")
str_c(c("x","y","z"), collapse = ", ")
x <- c("Apple","Banana","Pear")
str_sub(x, 1,3)
str_sub(x, -3,-1)
str_sub(x, 3,1)
str_sub(x,2,1)
str_sub(x,2,2)
str_sub(x, 1,2)
str_sub(x,1,1)
str_sub(x,3,1)

str_sub(x,1,1) <- str_to_lower(str_sub(x,1,1))
x

x <- c("Apple", "Eggplant", "Banana")
str_sort(x)
str_sort(x, locale = 'en')
str_sort(x, locale = "haw")

#Matching patterns with regular expressions

library(stringr)
x <- c("apple","banana","pear")

str_view(x,"an")
library(tidyverse)
library(stringr)


x <- c("apple","banana","pear")
x
str_view(x, "an")
str_view(x, ".a.")

library(htmltools)
install.packages("htmltools")
library(htmltools)

x <- c("apple","banana","pear")
x
str_view(x, "an")
str_view(x, ".a.")


#pending.....to come back












