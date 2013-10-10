rankall <- function(outcome, num = "best") {
     ## Read outcome data
     ## Check that outcome is valid
     ## For each state, find the hospital of the given rank
     ## Return a data frame with the hospital names and the
     ## (abbreviated) state name
     
     if (!(outcome %in% c("heart attack","heart failure","pneumonia"))) {
          stop("invalid outcome")
     }
     source("read_outcome.R")
     ocm <- read_outcome()
      
     if (outcome == "heart attack") {
          ocm2 <- ocm[order(ocm$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, ocm$Hospital.Name),]
          ocm2 <- ocm2[complete.cases(ocm2[,11]),]
     } else if (outcome == "heart failure") {          
          ocm2 <- ocm[order(ocm$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, ocm$Hospital.Name),]
          ocm2 <- ocm2[complete.cases(ocm2[,17]),]
     } else {
          ocm2 <- ocm[order(ocm$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, ocm$Hospital.Name),]
          ocm2 <- ocm2[complete.cases(ocm2[,23]),]
     }
     states <- sort(unique(ocm2$State))  # should return vector of states
     hospitals <- rep(NA,length(states))
     
     for (i in 1:length(states)) {
          ocm3 <- subset(ocm2, State == states[i])
          if (num == "best") {
               rank_index <- 1
          } else if (num == "worst") {          
               rank_index <- nrow(ocm3)
          } else if (num > nrow(ocm3)) {
               rank_index <- 0
          } else {
               rank_index <- num
          }
          
          if (rank_index == 0) {
               NA
          } else {
               hospitals[i] <- ocm3[rank_index,2]
          }
          
     }     
     result.df <- data.frame(hospital=hospitals,state=states)
     result.df
}
