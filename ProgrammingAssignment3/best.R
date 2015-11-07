best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
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
  d1 <- d[,c(2,col)]
  d1[,2] <- as.numeric(d1[,2])
  best <- sort(d1[which(d1[,2]==min(d1[,2], na.rm = TRUE)), 1])
  return(best[1])
}
