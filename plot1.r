
getwd()


## Here we load the large dataset.
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/household_power_consumption.zip",method="curl")
unzip ("./data/household_power_consumption.zip", exdir = "./data")
dateDownloaded <- date()
dateDownloaded
#read data
houseRawdata <- read.table("./data/household_power_consumption.txt", 
                          header = TRUE
                          , na.strings="?"
                          ,colClasses = c("character", "character", rep("numeric",7))
                          , sep= ";")
#since file is quite big
# another way would be to read only the subset
houseSub <- houseRawdata[(houseRawdata$Date == "1/2/2007" | houseRawdata$Date == "2/2/2007"),]
head(houseSub)

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
#Name each of the plot files as plot1.png, plot2.png, etc.
#Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file.
#Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)


## First Plot, looks like a hist red
hist(houseSub$Global_active_power, main ="Gobal Active Power", xlab ="Gobal Active Power (kilowatts)", ylab="Frequency"
      ,col = "Red")
?hist 

## export file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
