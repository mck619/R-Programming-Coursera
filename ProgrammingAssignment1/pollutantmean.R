pollutantmean <- function(directory, pollutant, id = 1:332) {

	  ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!

	df<- data.frame(Date = character(), sulfate = numeric(), nitrate = numeric(), 
			    ID = integer(), stringsAsFactors = TRUE)

	for(i in id){
		temp <- read.csv(paste(directory, paste(formatC(i,width=3,flag="0"),".csv", sep=""), sep = "/"))
		df<-rbind(df,temp)
	}
	return (mean(df[[pollutant]], na.rm = TRUE))
}