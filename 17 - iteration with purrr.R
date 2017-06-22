library(tidyverse)

df <- tibble(
        a = rnorm(10),
        b = rnorm(10),
        c = rnorm(10),
        d = rnorm(10),
)
df

median(df$a)
median(df$b)

output <- vector("double", ncol(df))
        for (i in seq_along(df))  {
                output[[i]] <- median(df[[i]])
        }
output
seq_along(df)
median(df[[3]])


output <- vector("double", ncol(mtcars))
        for (i in seq_along(mtcars))  {
                output[[i]] <- mean(mtcars[[i]])
        }
output

library(nycflights13)

outtype <- vector("character", ncol(flights))
        for (i in seq_along(flights))  {
        outtype[[i]] <- class(flights[[i]])
        }

outtype

iris

output  <- vector("double", ncol(iris))
        for (i in seq_along(iris))  {
                
                output[[i]] <- length(unique(iris[[i]]))
        }
output


# define following - output, sequence, body for writing any loop

mu <- c(-10, 0, 10, 100)

output <- matrix(nrow = 10, ncol = length(mu))
        for(i in seq_along(mu)) {
        output[,i] <- rnorm(10, mu[i])
        
        }

output


df <- tibble(
        a = rnorm(10),
        b = rnorm(10),
        c = rnorm(10),
        d = rnorm(10)
)
df

rescale01 <- function(x)  {
        rng <- range(x, na.rm = TRUE)
        (x - rng[1]) / (rng[2] - rng[1])
        }
rescale01(df)

df$a <- rescale01(df$a)
df$b <- rescale01(df$b)
df$c <- rescale01(df$c)
df$d <- rescale01(df$d)

df

for (i in seq_along(df)) {
        df[[i]] <- rescale01(df[[i]])
}
df

while(condition)  {
        #body
}

for (i in seq_along(x)) {
        #body
}

i <- 1
while(i <= length(x)) {
        #body
        i = i+1
}


flip <- function() sample(c("T", "H"),1)
flips <- 0
nheads <- 0
while(nheads <3)  {
        if(flip() == "H") {
                nheads = nheads +1
        } else {
                nheads <- 0
        }
        flips <- flips + 1
}

flips


df <- tibble(
        a = rnorm(10),
        b = rnorm(10),
        c = rnorm(10),
        d = rnorm(10)
)
df


map_dbl(df, mean)
map_dbl(df, median)
map_dbl(df,sd)


df %>% map_dbl(mean)
df %>% map_dbl(median)
df %>% map_dbl(sd)

models <- mtcars %>%
        split(.$cyl) %>%
        map(function(df) lm(mpg ~ wt, data = df))
models

models <- mtcars %>%
        split(.$cyl) %>%
        map(~lm(mpg ~ wt, data = .))

models

models %>% 
        map(summary) %>%
        map_dbl(~.$r.squared)

models %>%
        map(summary) %>%
        map_dbl("r.squared")


mtcars %>%
        map(mean)
flights %>%
        map(class)
iris %>%
        map(unique)
mu <- c(-10, 0, 10, 100)

mu %>%
        map(rnorm, n=10)

mu %>% map(~rnorm(10,.))

map(1:5, runif)

map(-2:2, rnorm, n=5)

map(~lm(mpg~wt), data=.)

#safely(); works with map, to run functions safely, will produce error/reason if function does not work

safe_log <- safely(log)
str(safe_log(10))
str(safe_log('a'))


x <- list(1, 10, "a")
y <- x %>% map(safely(log))
str(y)
y <- y %>% transpose()
str(y)

#similar to safely, there are functions called possibly(), quietly()

# multiple arguments ------------------------------------------------------

# map2, pmap()

mu <- list(5, 10, -3)
mu %>%
        map(rnorm, n=5) %>%
        str()

sigma <- list(1,5,10)

seq_along(mu) %>%
        map(~rnorm(5, mu[[.]], sigma[[.]])) %>%
        str()

map2(mu, sigma, rnorm, n=5) %>% str()

n<- list(1,3, 5)

args1 <- list(n, mu, sigma)
args1 %>% pmap(rnorm) %>% str()

args2 <- list(mean = mu, sd = sigma, n = n)
args2 %>% pmap(rnorm) %>% str()

params <- tribble (
        ~mean, ~sd, ~n,
        5,1,1,
        10,5,3,
        -3,10,5
)

params %>% pmap(rnorm)

library(tidyverse)
library(ggplot2)
library(stringr)
plots  <- mtcars %>%
        split(.$cyl) %>%
        map(~ggplot(.,aes(mpg,wt)) + geom_point())
        
        paths <- stringr::str_c(names(plots), ".pdf")
        pwalk(list(paths, plots), ggsave, path = tempdir())
        

        
        
iris %>% keep(is.factor) %>% str()                
iris %>% discard(is.factor) %>% str()

x <- list(1:5, letters, list(10))

x %>% some(is_character)
x %>% every(is_vector)

x <- sample(10)
x
x %>% detect(~ . >5)
x %>% detect_index (~ . >5)
x %>% head_while (~ . >5)
x %>% tail_while(~ . >5)

x %>% filter(x>5)
