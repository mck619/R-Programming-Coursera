corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!
	
	v<-vector("numeric")
	source("complete.R")
	c<-complete("specdata")
	c<-c[c$nobs>=threshold,]


	for(i in c[["id"]]){
	
		temp<-read.csv(paste(directory, paste(formatC(i,width=3,flag="0"),".csv", sep=""), sep = "/"))
		
		if(!any(complete.cases(temp))){
		next
		}

		corobs<-cor(temp$sulfate,temp$nitrate,use="complete")
		v<-append(v,corobs)
	}
	
	return (v)		
	
}