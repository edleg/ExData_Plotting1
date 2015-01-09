plot2 <- function() {             
        ## This function plots the Global Active Power vs. date for Coursera's 
        ## Exploratory Data Analysis course.
        ## Data are read from a .txt file, subsetted to the relevant days and then
        ## data are plotted. The plot is saved in a png file named plot2.R
        
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
        png(file="plot2.png",width = 480, height = 480, units = "px")
        
        # Plot the Global active power vs. date, with y label and omitting the default x axis
        plot(data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",xaxt="n")
        
        # Set the x axis format
        axis(1,at=c(1,nrow(data)/2,nrow(data)),labels=c("Thu","Fri","Sat"))
        
        # Close device
        dev.off()
}