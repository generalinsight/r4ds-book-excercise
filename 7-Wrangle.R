library(tidyverse)
as_tibble(iris)

tibble(
        x = 1:5,
        y = 1,
        z = x^2 + y
        
)
tribble(
        ~x, ~y, ~z,
        "a", 2, 3.6,
        "b", 1, 8.5
)


tibble(
        a = lubridate::now() + runif(1e3) * 86400,
        b = lubridate::today() + runif(1e3) * 30,
        c = 1:1e3,
        d = runif(1e3),
        e = sample(letters, 1e3, replace = TRUE)
)

library(nycflights13)
nycflights13::flights %>%
        print(n=10, width = Inf)

nycflights13::flights %>%
        View()

df <- tibble (
        x = runif(5),
        y = rnorm(5)
)
df
df$x
df[["x"]]
df[[1]]
df %>% .$x
df %>% .[["x"]]

class(as.data.frame(flights))

class(mtcars)
class
mtcars

# read_csv(), read_csv2(), read_tsv(), read_delim(), read_fwf(), read_table(), read_log(), webreadr, 

heights <- read_csv("data/heights.csv")

library(tidyverse)
library(readr)
read_csv("The first line of metadata\nThe second line of metadata\n
        x,y,z
         1,2,3", skip = 2)

read_csv("a,b,c\n1,2,.", na = ".")

data.table::fread() ## can be used to read large raw files quickly

read_csv("a,b\n1,2,3\n4,5,6")
read_csv("a,b,c\n1,2\n1,2,3,4")

str(parse_logical(c("TRUE", "FALSE","NA")))
str(parse_integer(c("1","2","3")))
str(parse_date(c("2010-01-01", "1979-01-14")))


#parse_logical(), parse_integer(), parse_double(), parse_chracter(), parse_factor(), parse_datetime(), parse_date(), parse_time();


parse_double("1.23")
parse_double("1,23", locale = locale(decimal_mark = ","))
parse_number("$100")
parse_number("20%")
parse_number("it cost $123.45")

parse_number("$123,456,789")
parse_number("$123.456.789", locale = locale(grouping_mark = "."))
parse_number("$123'456'789", locale = locale(grouping_mark = "'"))

library(hms)

# guess_parser(), parse_guess()

challenge <- read_csv(readr_example("challenge.csv"))
problems(challenge)

#~~~ more to complete for reading probmatic files with read_csv()


# write.csv(), write_tsv()

#write_excel_csv()

# write_rds(), read_rds(), readRDS(), saveRDS()

library(feather)












