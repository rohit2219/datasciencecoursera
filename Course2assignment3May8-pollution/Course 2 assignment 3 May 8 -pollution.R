#note that  beginning of time in R, is 1970-01-01, every time before that is 
#stored as a negative no like 1969 12 31 would be -1

#(Sys.time() gives you todays day,  %a
format(Sys.time(), "%a %b %d %X %Y")

Clearing workspace -->
    use ls() to see what all are the variables in your workspace
    use rm(list=ls())

  # POSIXlt and POSIXct can give different manipulations for date and time
> p=as.POSIXlt(x)
> names(unclass(p))
[1] "sec"    "min"    "hour"   "mday"   "mon"    "year"   "wday"   "yday"  
[9] "isdst"  "zone"   "gmtoff"
> p$sec
[1] 31.58454
> 
#isdst gives u if we are on daylight savings or not
    
    #strptime converts dates in char format to time format
    > a<-"december 29 1984"
    > k=strptime(a, %B)
    > class(x)
    [1] "POSIXct" "POSIXt" 
    > class(a)
    [1] "character"
    > class(k)
    [1] "POSIXlt" "POSIXt" 
   # note that datylight savings timezones etc are possible here in R
    
    
    #swirl assignment
    | When you are at the R prompt (>):
        | -- Typing skip() allows you to skip the current question.
    | -- Typing play() lets you experiment with R on your own; swirl will ignore what
    | you do...
    | -- UNTIL you type nxt() which will regain swirl's attention.
| -- Typing bye() causes swirl to exit. Your progress will be saved.
| -- Typing main() returns you to swirl's main menu.
    | -- Typing info() displays these options again.