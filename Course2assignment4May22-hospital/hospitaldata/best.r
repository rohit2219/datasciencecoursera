
best <- function(state, outcome_pass){
    init()
    dir_var=paste(rohwork,sep="")
    setwd(dir = dir_var)
    
    init_outcome=read.table("outcome-of-care-measures.csv", header=TRUE, sep=",")
    # get all state names in a list
    state_list=c(levels(init_outcome[, 7])) 
    if ( is.na(match(state,state_list))) {
        print ("invalid state")
        stop()
    }
    
    ## Return hospital name in that state with lowest 30-day death rate
    col_no <- if (outcome_pass == "heart attack") {
        11
    } else if (outcome_pass == "heart failure") {
        17
    } else if (outcome_pass == "pneumonia") {
        23
    } else {
        0
    }
    print(col_no)
    if (col_no == 0){
        print ("invalid outcome option")
        stop()}
    
    
    init_outcome[,col_no] <- suppressWarnings(as.numeric(init_outcome[,col_no]))
    outcome <- na.omit(init_outcome)
    
    statedata = subset(outcome, State==state)
    write.csv(statedata, file = "state.csv")
    orderdata = order(statedata[, col_no, 2])
    orderdata[1, 2]

}
    