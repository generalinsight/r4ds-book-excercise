library(tidyverse)
library(modelr)
options(na.action = na.warn)

sim1
View(sim1)

ggplot(sim1, aes(x,y)) +
        geom_point() +
        geom_smooth(se = FALSE)

models <- tibble(
        a1 = runif(250, -20, 40),
        a2 = runif(250, -5, 5)
)

ggplot(sim1, aes(x,y))+
        geom_abline(
                aes(intercept = a1, slope = a2),
                data = models, alpha = 1/4
        )+
        geom_point()


model1 <- function(a, data) {
        a[1] + data$x *a[2]
}

model1(c(7, 1,5), sim1)


measure_distance <- function(mod, data) {
        diff <- data$y - model1(mod, data)
        sqrt(mean(diff^2))
}

measure_distance(c(7, 1.5), sim1)


sim1_dist <- function(a1,a2) {
        measure_distance(c(a1, a2), sim1)
}

models <- models %>%
        mutate(dist = purrr::map2_dbl(a1,a2,sim1_dist))
models

ggplot(sim1, aes(x,y)) +
        geom_point(size = 2, color = 'grey30') +
        geom_abline(
                aes(intercept = a1, slope = a2, color = -dist),
                data = filter(models, rank(dist) <=10)
        )


ggplot(models, aes(a1,a2)) +
        geom_point(
                data = filter(models, rank(dist) <=10),
                size = 4, color = "red"
        ) +
        geom_point(aes(color = -dist))




grid <- expand.grid(
        a1 = seq(-5, 20, length = 25),
        a2 = seq(1, 3, length = 25)
) %>%
        mutate(dist = purrr::map2_dbl(a1, a2, sim1_dist))

grid

grid %>% 
        ggplot(aes(a1,a2))+
        geom_point(
                data = filter(grid, rank(dist) <=10),
                size = 4, color = "red"
        ) +
        geom_point(aes(color = -dist))


ggplot(sim1, aes(x,y)) +
        geom_point(size = 2, color = "grey30") +
        geom_abline(
                aes(intercept = a1, slope = a2, color = -dist),
                data = filter(grid, rank(dist) <=10)
        )

# gradient descent in R is Newton-Raphson, and a function called optim


best <- optim(c(0,0), measure_distance, data = sim1)
best
best$par


ggplot(sim1, aes(x,y))+
        geom_point(size = 2, color = "grey30")+
        geom_abline(intercept = best$par[1], slope = best$par[2])


sim1_mod <- lm(y ~ x, data = sim1)
coef(sim1_mod)

coef(sim1_mod)[1]
coef(sim1_mod)[2]

sim1a <- tibble(
        x = rep(1:10, each = 3),
        y = x*1.5 +6 + rt(length(x), df = 2)
)
sim1a

sim1a_mod <- lm(y~x, data = sim1a)
coef(sim1a_mod)
sim1a_mod

ggplot(sim1a, aes(x,y))+
        geom_point(size = 2, color = "grey40")+
        geom_abline(intercept = coef(sim1a_mod)[1], slope = coef(sim1a_mod)[2])





