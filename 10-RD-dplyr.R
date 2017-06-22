# relational data with dplyr
#       mutating joins, filtering joins, set operations

library(tidyverse)
library(nycflights13)
airlines
airports
planes
weather


#primary key, foreign key,

planes %>% count(tailnum) %>% filter(n>1)
weather %>% count(year, month, day, hour, origin) %>% filter(n>1)
flights %>% count(year, month, day, flight) %>% filter(n>1)
flights %>% count(year, month, day, tailnum) %>% filter(n>1)


# mutate(), row_number(), surrogate key

flights %>% mutate(row_number())

Lahman::Batting
babynames::babynames
diamonds

flights2 <- flights %>%
        select(year:day, hour, origin, dest, tailnum, carrier)

flights2
View(flights2)

flights2 %>%
        select(-origin, -dest) %>%
        left_join(airlines, by = "carrier")


x <- tribble(
        ~key, ~val_x,
        1,"x1",
        2,"x2",
        3,"x3"
)
y <- tribble(
        ~key, ~val_y,
        1,"y1",
        2,"y2",
        4,"y3"
)


x %>%
        inner_join(y, by = "key")

# inner join keeps observations where key is same between tables. 
#For outer joins, there are 3 types - left join ( keeps all from left and equals from right); right join ( all from right, and equals from left), full join (all observations between the two tables)


flights2 %>%
        left_join(weather)

flights2 %>%
        left_join(planes, by="tailnum")
airports

flights2 %>%
        left_join(airports, c("dest" = "faa"))

flights2 %>%
        left_join(airports, c("origin" = "faa"))


airports %>%
        semi_join(flights, c("faa" = "dest")) %>%
        ggplot(aes(lon, lat)) +
        borders("state") +
        geom_point() +
        coord_quickmap()


delay

avgdelay <- flights %>%
        group_by(dest) %>%
        summarize(delay = mean(arr_delay, na.rm = TRUE)) %>%
        left_join(airports, c("dest" = "faa"))

ggplot(avgdelay, mapping = aes(x=lon,y=lat), color = delay) + borders("state") +geom_point(aes(color = delay)) +
        coord_quickmap()

# base::merge() can do all four joins too; however, dplyr verbs are simpler


#filtering joins --- semi_join(x,y) which keeps all x with match in y, anti_join(x,y) drops all in x that match in y































