best <- function(state, outcome) {
     ## Read outcome data
     ## Check that state and outcome are valid
     ## Return hospital name in that state with lowest 30-day death
     ## rate
     
     source("read_outcome.R")
     ocm <- read_outcome()
     if (!(state %in% ocm$State)){
          stop("invalid state")
     } else if (!(outcome %in% c("heart attack","heart failure","pneumonia"))) {
          stop("invalid outcome")
     } 
     
     # subset the data to match only the observations with the correct state
     ocm <- subset(ocm, State == state)
     
     if (outcome == "heart attack") {
          ##complete_HA = ocm[complete.cases(ocm[,11]),]      
          ocm2 <- ocm[order(ocm$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, ocm$Hospital.Name),]
     } else if (outcome == "heart failure") {          
          ocm2 <- ocm[order(ocm$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, ocm$Hospital.Name),]
     } else {
          ocm2 <- ocm[order(ocm$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, ocm$Hospital.Name),]
     }
     ocm2[1,2]     
}
