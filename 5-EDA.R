library(tidyverse)
library(dplyr)
library(nycflights13)

not_cancelled <- flights %>% 
        filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>% 
        group_by(year, month, day) %>%
        summarize(mean = mean(dep_delay))

ggplot(data = diamonds) +geom_bar(mapping = aes(x = cut))
ggplot(data = diamonds) + geom_bar(mapping = aes(x=cut))

diamonds %>% count(cut)

ggplot(diamonds) + geom_histogram (mapping = aes(x = carat), binwidth = 0.5)

smaller <- diamonds %>% filter(carat <3)
ggplot(smaller, mapping = aes(x = carat)) + geom_histogram(binwidth = 0.1)
ggplot(smaller, mapping = aes(x = carat, color = cut)) + geom_freqpoly(binwidth = 0.1)

ggplot(data = faithful, mapping = aes(x = eruptions)) + geom_histogram(binwidth = 0.25)
ggplot(diamonds) + geom_histogram(mapping = aes(x=y), binwidth = 0.5) + coord_cartesian(ylim = c(0,50))

ggplot(diamonds) + geom_histogram(mapping = aes(z), binwidth = 1)
ggplot(diamonds, mapping = aes(x=x, y=y)) + geom_point(x=x,y=y)
diamonds %>% ggplot(mappings = aes(x=x, y=y)) + geom_point(mapping = aes(x=x,y=y)) + geom_smooth(mapping = aes(x=x,y=y), se = FALSE)
ggplot(diamonds) + geom_histogram(mapping = aes(x=price), binwidth = 0.5)
diamonds %>% mutate(xyz = x*y*z)
ggplot(diamonds, mapping = aes(x=price, y=x*y*z)) + geom_point() + geom_smooth()+coord_cartesian(ylim = c(0,1000))

ggplot(diamonds, mapping = aes(x=price)) + geom_histogram(mapping = aes(x=price), binwidth = 0.5) +
        coord_cartesian(ylim = c(0,50))

by_carat <- diamonds %>% group_by(carat) %>% summarise(count = n(), price = mean(price), dimension = mean(x*y*z))
by_carat %>% filter(carat %in% c(0.99,1))

diamonds2 <- diamonds %>% filter(between(y, 3, 20))
diamonds2 <- diamonds %>% mutate(y=ifelse(y<3 | y>20, NA, y ))

ggplot(data=diamonds2, mapping = aes(x=x, y=y)) + geom_point(na.rm = TRUE)

ggplot(diamonds, aes(cut, price)) + geom_boxplot()

ggplot(mpg, aes(class,hwy)) + geom_boxplot()

ggplot(mpg) + geom_boxplot(
        mapping = aes(
                x = reorder(class, hwy, FUN = median),
                y = hwy
        )
) + 
        coord_flip()

ggplot(mpg) + geom_boxploth(
        mapping = aes(
                x = reorder(class, hwy, FUN = median),
                y = hwy
        )
)
ggplot(mpg) + geom_violin(
        mapping = aes(
                x = reorder(class, hwy, FUN = median),
                y = hwy
        )
)
ggplot(diamonds) + geom_lv(aes(cut, price))
ggplot(diamonds) + geom_boxplot(aes(cut, price))
ggplot(diamonds) + geom_violin(aes(x=cut, y=price)) + facet_wrap("clarity")

ggplot(diamonds) + geom_count(aes(cut, color))

diamonds %>% count(color,cut) %>%
        ggplot(aes(color, cut)) + geom_tile(aes(fill = n))

ggplot(smaller) + geom_bin2d(aes(x=carat,y=price))
ggplot(smaller) + geom_hex(aes(x=carat,y=price))

ggplot(smaller, aes(x=carat, y=price)) + geom_boxplot(aes(group=cut_width(carat,0.1)))

ggplot(smaller, aes(x=carat, y=price)) + geom_boxplot(aes(group=cut_number(carat,20)))


ggplot(faithful) + geom_point(aes(eruptions,waiting))

library(modelr)
mod <- lm(log(price) ~ log(carat), data = diamonds)
diamonds2 <- diamonds %>%
        add_residuals(mod) %>%
        mutate(resid = exp(resid))
ggplot(diamonds2) +
        geom_point(aes(x = carat, y = resid))

ggplot(diamonds2) +
        geom_boxplot(aes(cut,resid))










