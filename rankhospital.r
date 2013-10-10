rankhospital <- function(state, outcome, num = "best") {
     ## Read outcome data
     ## Check that state and outcome are valid
     ## Return hospital name in that state with the given rank
     ## 30-day death rate
     
     ocm <- get_clean_state_and_outcome_data(state,outcome)
     
     # choose the proper index
     
     if (num == "best") {
          rank_index <- 1
     } else if (num == "worst") {          
          rank_index <- nrow(ocm)
     } else if (num > nrow(ocm)) {
          rank_index <- 0
     } else {
          rank_index <- num
     }
     
     if (rank_index == 0) {
          NA
     } else {
          ocm[rank_index,2]
     }
}

get_clean_state_and_outcome_data <- function(state, outcome) {

     ## Read outcome data from appropriate state
     ## Error check the state and outcome data
     ## Remove na values and sort the vector
     
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
               ocm2 <- ocm[order(ocm$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, ocm$Hospital.Name),]
               ocm2 <- ocm2[complete.cases(ocm2[,11]),]
          } else if (outcome == "heart failure") {          
               ocm2 <- ocm[order(ocm$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, ocm$Hospital.Name),]
               ocm2 <- ocm2[complete.cases(ocm2[,17]),]
          } else {
               ocm2 <- ocm[order(ocm$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, ocm$Hospital.Name),]
               ocm2 <- ocm2[complete.cases(ocm2[,23]),]
          }
          ocm2
}
