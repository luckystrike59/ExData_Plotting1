loadData <- function(wd,file){
    
    #Set the working directory
    setwd(wd)
    #Set the file name
    fileURL <- file #"household_power_consumption.txt"
    
    #check to see if this file has already been read in to the global variable ds
    if(!exists("ds")) {
        print("Reading Data...")
        ds <<-read.csv(fileURL,sep=";",header=TRUE,dec=".")
      }
  
    ds
}