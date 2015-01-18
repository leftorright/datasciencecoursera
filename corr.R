## the location of the CSV files

## threshold is a numeric vector of length 1 indicating the
## number of completely observed observations (on all variables)
## required to compute the correlation between nitrate and sulfate
## the default is 0

## Returns a numeric vector of correlations

corr <- function(directory, threshold = 0) {
    files_list <- list.files(directory, full.names=TRUE)
    data <- data.frame()
    cor_data <- vector(mode = 'list')
    complete <- complete(directory)
    complete_values <- complete$nobs
    
    for(i in 1:332) {
        if(complete_values[i] >= threshold){
            data <- na.omit(read.csv(files_list[i]))
            
            # get sulfate and nitrate data
            s_data <- data$sulfate
            n_data <- data$nitrate
            
            cor_data <- append(cor_data, cor(s_data, n_data))
            
            
        } else {
            next
        }
    }
    end_data <- do.call(rbind,cor_data)
}
