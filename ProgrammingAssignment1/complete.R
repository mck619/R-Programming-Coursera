complete <- function(directory, id = 1:332){

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

	df<- data.frame(id = numeric(), nobs = numeric())

	for(i in id){
		temp <- read.csv(paste(directory, paste(formatC(i,width=3,flag="0"),".csv", sep=""), sep = "/"))
		y<-complete.cases(temp)
		count<- 0
		for(row in y){
			if(row == TRUE){
			count <- count + 1
			}
		}
		df<-rbind(df, data.frame(id=i, nobs=count))
	}
	return(df)
}
			
		