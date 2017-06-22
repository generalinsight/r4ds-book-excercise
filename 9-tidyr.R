library(tidyverse)
table1
table1 %>% mutate(rate= cases/population *10000)
table1 %>% count(year, wt = cases)

library(ggplot2)
ggplot(table1, aes(year, cases)) + 
        geom_line(aes(group = country), color = "grey50") +
        geom_point(aes(color = country))

table2
# gather(), spread()

tidy4a <- table4a %>% gather('1999', '2000', key = "year", value = 'cases')
tidy4b <- table4b %>% gather(`1999`, `2000`, key = "year", value = "population")
left_join(tidy4a, tidy4b)

table2 %>% spread(key = type, value = count)


stocks <- tibble(
        year = c(2015,2015,2016,2016),
        half = c(1,2,1,2),
        return = c(1.88,0.59,0.92,0.17)
)
stocks %>%
        spread(year, return) %>%
        gather("year", "return", `2015`, `2016`)

# seperate(), unite()

table3 %>% separate(rate, into = c("cases", "population"), convert = TRUE)
table3 %>% separate(year, into = c("century", "year"), sep = 2)


table5 %>% unite(new, century, year, sep = "")


stocks <- tibble(
        year = c(2015,2015,2015,2015,2016,2016,2016),
        qtr = c(1,2,3,4,2,3,4),
        return = c(1.88,0.59,0.35,NA,0.92,0.17,2.66)
)

stocks

stocks %>% spread(year, return) %>%
        gather(year, return, `2015`:`2016`, na.rm=TRUE)

stocks %>% complete(year, qtr)


treatment <- tribble(
        ~person, ~treatment, ~response,
        "Derrick Whitmore",1,7,
        NA,2,10,
        NA,3,9,
        "Katherine Burke", 1,4
)

treatment %>% fill(person)

tidyr::who
who

who1 <- who %>% gather(
        new_sp_m014:newrel_f65, key = "key", value = 'cases', na.rm = TRUE
)

who1 %>% count(key)
who2 <- who1 %>%
        mutate(key = stringr::str_replace(key, "newrel", "new_rel"))
who2

who3 <- who2 %>%
        separate(key, c("new", "type", "sexage"), sep = "_")
who3 %>% count(new)

who4 <- who3 %>%
        select(-new, -iso2, iso3)
who5 <- who4 %>%
        separate(sexage, c("sex", "age"), sep = 1)
who5

#therefore, do all of this together in one go....

who5 <- who %>%
        gather(new_sp_m014:newrel_f65, key = "key", value = 'cases', na.rm = TRUE) %>%
        mutate(key = stringr::str_replace(key, "newrel", "new_rel")) %>%
        separate(key, c("new", "type", "sexage"), sep = "_") %>%
        select(-new, -iso2, -iso3) %>%
        separate(sexage, c("sex", "age"), sep = 1)
                
who6 <- who5 %>% group_by(country, year, sex) %>%
        summarize(count = sum(cases))
who6

ggplot(who6, aes(x=year, y=count)) + geom_point() + geom_smooth()

who6

who7 <- who6 %>% group_by(year) %>%
        summarize(cases = sum(count))

who7
        ggplot(who7, aes(year, cases)) + geom_point() + geom_smooth()

?tidyr
        