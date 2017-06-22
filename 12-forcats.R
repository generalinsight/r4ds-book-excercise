library(tidyverse)
library(forcats)

x1 <- c("Dec", "Apr", "Jan", "Mar")
sort(x1)

month_levels <- c(
        "Jan","Feb","Mar","Apr","May","Jun",
        "Jul","Aug","Sep","Oct","Nov","Dec"
)
y1 <- factor(x1,levels = month_levels)
y1
sort(y1)
month.name
month.abb
gss_cat
gss_cat %>% count(race)

ggplot(gss_cat, aes(race))+geom_bar()
ggplot(gss_cat, aes(race))+geom_bar()+scale_x_discrete(drop=FALSE)

gss_cat %>% count(rincome)
ggplot(gss_cat, aes(rincome)) + geom_bar() + coord_flip()
ggplot(gss_cat, aes(relig))+geom_bar()+coord_flip()
ggplot(gss_cat, aes(partyid))+geom_bar()+coord_flip()

relig <- gss_cat %>%
        group_by(relig)%>%
        summarize(
                age = mean(age, na.rm = TRUE),
                tvhours = mean(tvhours, na.rm = TRUE),
                n = n()
        )

ggplot(relig, aes(tvhours, relig)) + geom_point()
ggplot(relig, aes(tvhours, fct_reorder(relig, tvhours))) + geom_point()

relig %>%
        mutate(relig = fct_reorder(relig, tvhours)) %>%
        ggplot(aes(tvhours, relig))+
        geom_point()


rincome <- gss_cat %>%
        group_by(rincome) %>%
        summarize(
                age = mean(age, na.rm = TRUE),
                tvhours = mean(tvhours, na.rm = TRUE),
                n = n()
        )
ggplot(rincome, aes(age, fct_reorder(rincome, age))) + geom_point()
ggplot(rincome, aes(age, fct_relevel(rincome, "Not applicable"))) + geom_point()

by_age <- gss_cat %>%
        filter(!is.na(age))%>%
        group_by(age, marital)%>%
        count()%>%
        mutate(prop = n / 21483)
by_age
View(by_age)
gss_cat

ggplot(by_age, aes(age, prop, color = fct_reorder2(marital, age, prop))) +
        geom_hex()+
        labs(color = "marital")

gss_cat %>%
        mutate(marital = marital %>% fct_infreq() %>% fct_rev()) %>%
        ggplot(aes(marital))+
        geom_bar()


gss_cat %>% count(partyid)

gss_cat %>%
        mutate(partyid = fct_recode(partyid, 
        .......###inicomeple, to avoid a lot of typing
        ))

gss_cat %>%
        mutate(partyid = fct_collapse(partyid, 
        other = c("No answer", "Don't know", "Other party"),
        rep = c("Strong republican", "Not str republican"),
        ind = c("Ind,near rep", "Independent", "Ind,near dem"),
        dem = c("Not str democrat", "Strong democrat")
         
        )) %>%
        count(partyid)

gss_cat %>%
        mutate(relig = fct_lump(relig)) %>%
        count(relig)

gss_cat %>%
        mutate(relig = fct_lump(relig, n=10)) %>%
        count(relig, sort = TRUE)

gss_cat %>%
        mutate(relig = fct_lump(relig, n=7) %>% fct_infreq() %>%fct_rev()) %>%
        ggplot(aes(relig)) +
        geom_bar()

?forcats
