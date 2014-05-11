plot4 <- function(outputType=1,
                  dir="~/Documents/Coursera/Exploratory Data Analysis/Assignments", #dir=location of file to be read
                  file="household_power_consumption.txt"  #file = file to be read
){
    #Load required functions
    source("loadData.R")
    #source("plot2.R")
    #source("plot3.R")
        
    # Call the loadData() function to retrieve data from the global variable if it exists, otherwise data will be read from the
    # flat file and saved in a global variable called ds. This should save processing time if the flat file has a large amount of
    # data.
    dsCopy <- loadData(dir,file)
    
    #Format the Date values into a Date datatype
    dsCopy[,1] <- as.Date(dsCopy[,1],format="%d/%m/%Y")
   
    #Get data only pertaining to 2007-02-01 and 2007-02-02
    subDT <- subset(dsCopy,dsCopy$Date==("2007-02-01") | dsCopy$Date==("2007-02-02"))
        
    #Set the size of the output to a 2x2 grid
    par(mfcol=c(2,2),mar=c(4,4,2,2))
    
    #outputType = 1 means to save the plots to a png file, otherwise output to plot screen
    if(outputType==1){ 
        #Start the copy process to a png file
        dev.copy(png,file="plot4.png",width=480,height=480)
        
        with(subDT,{
                #Generate the histogram
                #plot2(0,"") #0 means do not save plot to a file; pass in a blank string for the main title parametre
                #plot3(0,"n") #0 means do not save plot to a file;"n" means do not show legend board
                
                #Plot the data; Combine the Date and Time column by using the as.POSIXct function
                plot(as.POSIXct(paste(subDT$Date, subDT$Time),format="%Y-%m-%d %H:%M:%S"),
                     as.numeric(as.character(subDT$Global_active_power)),
                     type="l",
                     ylab="Global Active Power",
                     xlab="")
                
                #Plot the data; Combine the Date and Time column by using the as.POSIXct function
                plot(as.POSIXct(paste(subDT$Date, subDT$Time), format="%Y-%m-%d %H:%M:%S"),
                     as.numeric(as.character(subDT$Sub_metering_1)),
                     type="l",
                     ylab="Energy sub metering",
                     xlab="",
                     ylim=c(0,30))
                
                par(new=TRUE)
                
                plot(as.POSIXct(paste(subDT$Date, subDT$Time), format="%Y-%m-%d %H:%M:%S"),
                     as.numeric(as.character(subDT$Sub_metering_2)),
                     type="l",
                     ylab="Energy sub metering",
                     xlab="",
                     col="red",
                     ylim=c(0,30))
                
                par(new=TRUE)
                
                plot(as.POSIXct(paste(subDT$Date, subDT$Time), format="%Y-%m-%d %H:%M:%S"),
                     as.numeric(as.character(subDT$Sub_metering_3)),
                     type="l",
                     ylab="Energy sub metering",
                     xlab="",
                     col="blue",
                     ylim=c(0,30))
            
                #add the legend
                legend("topright",
                       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
                       lty=c(1,1), # gives the legend appropriate symbols (lines)
                       col=c("black","red","blue"),
                       bty="n"
                ) 
                
                #Plot the data; Combine the Date and Time column by using the as.POSIXct function
                plot(as.POSIXct(paste(subDT$Date, subDT$Time), format="%Y-%m-%d %H:%M:%S"),
                     as.numeric(as.character(subDT$Voltage)),
                     type="l",
                     ylab="Voltage",
                     xlab="datetime",
                     ylim=c(234,246))
                
                #Generate historgram for Global reactive power vs datetime      
                plot(as.POSIXct(paste(subDT$Date, subDT$Time), format="%Y-%m-%d %H:%M:%S"),
                     as.numeric(as.character(subDT$Global_reactive_power)),
                     type="l",
                     ylab="Global_reactive_power",
                     xlab="datetime",
                )
            }
        )
        #close the copying
        dev.off()
    }
    #Display the plots in the plot window
    else{
        with(subDT,{ #START: with()
                #Generate the histogram
                #plot2(0,"") #0 means do not save plot to a file; pass in a blank string for the main title parametre
                #plot3(0,"n") #0 means do not save plot to a file;"n" means do not show legend board
            
                #Plot the data; Combine the Date and Time column by using the as.POSIXct function
                plot(as.POSIXct(paste(subDT$Date, subDT$Time),format="%Y-%m-%d %H:%M:%S"),
                     as.numeric(as.character(subDT$Global_active_power)),
                     type="l",
                     ylab="Global Active Power",
                     xlab="")
                
                #Plot the data; Combine the Date and Time column by using the as.POSIXct function
                plot(as.POSIXct(paste(subDT$Date, subDT$Time), format="%Y-%m-%d %H:%M:%S"),
                     as.numeric(as.character(subDT$Sub_metering_1)),
                     type="l",
                     ylab="Energy sub metering",
                     xlab="",
                     ylim=c(0,30))
                
                par(new=TRUE)
                
                plot(as.POSIXct(paste(subDT$Date, subDT$Time), format="%Y-%m-%d %H:%M:%S"),
                     as.numeric(as.character(subDT$Sub_metering_2)),
                     type="l",
                     ylab="Energy sub metering",
                     xlab="",
                     col="red",
                     ylim=c(0,30))
                
                par(new=TRUE)
                
                plot(as.POSIXct(paste(subDT$Date, subDT$Time), format="%Y-%m-%d %H:%M:%S"),
                     as.numeric(as.character(subDT$Sub_metering_3)),
                     type="l",
                     ylab="Energy sub metering",
                     xlab="",
                     col="blue",
                     ylim=c(0,30))
                
                #add the legend
                legend("topright",
                       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
                       lty=c(1,1), # gives the legend appropriate symbols (lines)
                       col=c("black","red","blue"),
                       bty="n"
                ) 
            
                #Plot the data; Combine the Date and Time column by using the as.POSIXct function
                plot(as.POSIXct(paste(subDT$Date, subDT$Time), format="%Y-%m-%d %H:%M:%S"),
                     as.numeric(as.character(subDT$Voltage)),
                     type="l",
                     ylab="Voltage",
                     xlab="datetime",
                     ylim=c(234,246))
                
                #Generate historgram for Global reactive power vs datetime      
                plot(as.POSIXct(paste(subDT$Date, subDT$Time), format="%Y-%m-%d %H:%M:%S"),
                     as.numeric(as.character(subDT$Global_reactive_power)),
                     type="l",
                     ylab="Global_reactive_power",
                     xlab="datetime",
                )
            } #END: with()
        )
    }
}