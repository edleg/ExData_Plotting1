plot1 <- function() {             
        ## This function plots the histogram of the Global Active Power for Coursera's 
        ## Exploratory Data Analysis course.
        ## Data are read from a .txt file, subsetted to the relevant days and then
        ## an histogram is plotted. The plot is saved in a png file named plot1.png
        
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
        png(file="plot1.png",width = 480, height = 480, units = "px")
        
        # Plot the red histogram, with main title and x label
        hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
        
        # Close device
        dev.off()
}