library(magrittr)

#functions that do not work with pipe are - assign(), get(), load();

# pipes are %>%, also check %T>%, %$>%, %<>%;

# next section ------------------------------------------------------------

wt_mean <- function(x, w, na.rm = FALSE)  {
        stopifnot(is.logical(na.rm), length(na.rm) == 1)
        stopifnot(length(x) == length(w))
        
        if(na.rm)  {
                miss  <- is.na(x)  |  is.na(w)
                x <- x[!miss]
                w <- w[!miss]
        }
        sum(w  *  x)  /  sum(x)
}