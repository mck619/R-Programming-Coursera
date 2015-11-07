rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  
  o <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  d <- o[o$State == state,]
  
  if(nrow(d) == 0){
    stop("invalid state")
  }
  
  if(outcome == "heart attack"){
    col <- 11
  }else if(outcome == "heart failure"){
    col <- 17
  }else if(outcome == "pneumonia"){
    col <- 23
  }else{
    stop("invalid outcome")
  }
  
  d1<- d[,c(2,col)]
  d1[,2] <- as.numeric(d1[,2])
  od1 <- d1[order(d1[,2], d1[,1]),]
  od1<-od1[complete.cases(od1),]
  
  if(class(num)=="character"){
    
    if (num == "best"){
      return(best(outcome,state))
    }
    else if(num == "worst"){
      num <- nrow(od1)
    }
  }
  
  else{
    
    if(nrow(od1)<num){
      return(NA)
    }
  }
    
  return(od1[num,1])
}
