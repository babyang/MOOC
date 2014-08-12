pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
       
        p <- c()
        dat <- data.frame()
       
        for(i in id){
                re <- reg(i)
                
                path <- paste(re,".csv",sep = "")
                dir <- paste(directory,"/", sep ="")
                path <- paste(dir,path,sep = "")
                pt <- read.csv(path)
                dat <- rbind(dat,pt)
                #t <- pt[[pollutant]]
                #p <- c(p,t)
             
              
        }
        p<-dat[[pollutant]]
      
       m1<- mean(p,na.rm=T)
       m1<-round(m1,3)
       m1
}

reg <- function(i){
        if(i < 10)
                i <- paste("00",i,sep = "")
        else if(i >=10 && i < 100)
                i <- paste("0",i,sep = "")
}
