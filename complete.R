## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases

complete <- function(directory, id=1:332) {
    files_list <- list.files(directory, full.names = TRUE)
    dat <- data.frame()
    print(dat)
    for (i in id) {
        nobs <- sum(complete.cases(read.csv(files_list[i])))
        id <- i
        dat <- rbind(dat, cbind(id, nobs))
    }
    dat
}
