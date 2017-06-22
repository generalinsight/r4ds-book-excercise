library(tidyverse)

# vectors are of two types - atomic vectors - includes logical, integer, double, character, complex and raw.
# integer and double vectors are known as numeric vectors.
# and the Lists, is also called recursive vector, since a lists can contain other lists.
# atomimc vectors are homogenous while lists are heterogenous.
# NULL behaves like a vector of 0 length. NA is a missing value within a vector.


# code --------------------------------------------------------------------

typeof(letters)
x <- list("a", "b", 1:10)
length(x)

c(-1, 0, 1) / 0

# for checking, use, is.na, is.finite, is.infinite, is.nan
# explicit coercion  as.logical, as.double, as.integer, as.character
# to check, is_logical, is_integer, etc

# names(), class(), dim(),