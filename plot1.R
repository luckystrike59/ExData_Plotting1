plot1 <- function(outputType=1,#1=output to the png device
                  dir="~/Documents/Coursera/Exploratory Data Analysis/Assignments", #dir=location of file to be read
                  file="household_power_consumption.txt"                            #file=file to be read
){
    #Load helper R script
    source("loadData.R")
    
    # Call the loadData() function to retrieve data from the global variable if it exists, otherwise data will be read from the
    # flat file and saved in a global variable called ds. This should save processing time if the flat file has a large amount of
    # data.
    dsCopy <- loadData(dir,file)
    dsCopy[,1] <- as.Date(dsCopy[,1],format="%d/%m/%Y")
    
    #Get data only pertaining to 2007-02-01 and 2007-02-02
    subDT <- subset(dsCopy,dsCopy$Date==("2007-02-01") | dsCopy$Date==("2007-02-02"))
    
    #Set the size of the output to a 2x2 grid
    par(mfcol=c(1,1))
    
    #OutputType of 1 means to save as png
    if(outputType==1){
        #Start the copy process to a png file
        dev.copy(png,file="plot1.png",width=480,height=480)
        
        #Generate the histogram
        hist(as.numeric(as.character(subDT$Global_active_power)),
             col="red",
             main="Global Active Power",
             xlab="Global Active Power (kilowatts)")
        
        #close the copying
        dev.off()
    }
    else{
        #Generate the histogram
        hist(as.numeric(as.character(subDT$Global_active_power)),
             col="red",
             main="Global Active Power",
             xlab="Global Active Power (kilowatts)")
    }
    
}
