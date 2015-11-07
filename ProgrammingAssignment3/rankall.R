rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  
  
  if(outcome == "heart attack"){
    col <- 11
  }else if(outcome == "heart failure"){
    col <- 17
  }else if(outcome == "pneumonia"){
    col <- 23
  }else{
    stop("invalid outcome")
  }
  
  o <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  results.df <- data.frame(hospital = character(), state = character())
  
  d1<- o[,c(2,7,col)]
  d1[,3] <- as.numeric(d1[,3])
  od1 <- d1[order(d1[,3], d1[,1]),]
  od1<-od1[complete.cases(od1),]
  od2 <- split(od1, od1$State)
  
  for (i in od2){
    if(num == "worst"){
      n<-nrow(i)
    }
    else if(num == "best"){
      n<-1
    }
    else{
      n<-num
    }
    s <- i[[2]][1]
    h <- i[[1]][n]
    results.df <- rbind(results.df, data.frame(hospital = h,state = s))
  }
  return(results.df)
}