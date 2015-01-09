plot4 <- function() {             
        ## This function plots the Global Active Power vs. date for Coursera's 
        ## Exploratory Data Analysis course.
        ## Data are read from a .txt file, subsetted to the relevant days and then
        ## data are plotted. The plot is saved in a png file named plot4.R
        
        ## Get working directory
        working_dir<-getwd()
        
        # Compose the full path of data file
        file_name<-file.path(working_dir,"household_power_consumption.txt")
        
        # Read data, specifing the NA value used in file
        # (Data could probably be better read specifying only the lines of interest in the file, 
        ## but this approach supposes a previous knowledge of the structure of the file)
        data<-read.table(file_name,header=TRUE,sep=";",na.strings="?")
        
        # Convert dates to date class objects
        dates<-strptime(data$Date,"%d/%m/%Y")
        
        # Setting the date range of interest
        begin<-strptime("2007-02-01","%Y-%m-%d")
        end<-strptime("2007-02-02","%Y-%m-%d")
        
        # Subsetting data
        data<-data[dates>=begin & dates<=end ,]
        
        # Open png device, setting width and height
        png(file="plot4.png",width = 480, height = 480, units = "px")
        
        par(mfcol=c(2,2))
        
        ## Plot number 1 (1,1)
                # Plot the Global active power vs. date, with y label and omitting the default x axis
                plot(data$Global_active_power,type="l",xlab="",ylab="Global Active Power",xaxt="n")      
                # Set the x axis format
                axis(1,at=c(1,nrow(data)/2,nrow(data)),labels=c("Thu","Fri","Sat"))
        
        ## Plot number 2 (2,1)
                # Plot the Sub_metering_1 (in black), with y label and omitting the default x axis
                plot(data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",xaxt="n")
                # Add Sub_metering_2 (in red)
                lines(data$Sub_metering_2,col="red")
                # Add Sub_metering_3 (in blue)
                lines(data$Sub_metering_3,col="blue")      
                # Set the x axis format
                axis(1,at=c(1,nrow(data)/2,nrow(data)),labels=c("Thu","Fri","Sat"))       
                # Set the legend
                legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=2)
                
        
        ## Plot number 3 (1,2)
                # Plot the Global active power vs. date, with x and y label and omitting the default x axis
                plot(data$Voltage,type="l",xlab="datetime",ylab="Voltage",xaxt="n")      
                # Set the x axis format
                axis(1,at=c(1,nrow(data)/2,nrow(data)),labels=c("Thu","Fri","Sat"))
              
        
        ## Plot number 4 (2,2)
                # Plot the Global reactive power vs. date, with x and y label and omitting the default x axis
                plot(data$Voltage,type="l",xlab="datetime",ylab="Global_reactive_power",xaxt="n")      
                # Set the x axis format
                axis(1,at=c(1,nrow(data)/2,nrow(data)),labels=c("Thu","Fri","Sat"))
        
        # Close device
        dev.off()
}