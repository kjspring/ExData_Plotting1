# Load Data script
# Filename: loading.R
# Exploratory Data Analysis
# Kevin Spring
# 2014-08-06
###############################################################################

loading <- function() {

  # Create necessary directories and files
  
  # Check if data exists, if not creates it and downloads the file and extracts
  if(!dir.exists("data")) { 
    fileURL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
    cat("data directory does not exist. Creating directory, downloading, and unzipping data.")
    dir.create("data")
    download.file(url=fileURL, destfile="data/household_power_consumption.zip")
    unzip(zipfile="data/household_power_consumption.zip")
  }
  
  # Check if data file exists, if downloads and extracts
  if(!file.exists("data/household_power_consumption.txt")) {
    cat("Data file does not exist. Checking for zip file")
    if(!file.exists("data/household_power_consumption.zip")) {
      cat("Zip file does not exist. Downloading and extracting.")
      fileURL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
      download.file(url=fileURL, destfile="data/household_power_consumption.zip")
      unzip(zipfile="data/household_power_consumption.zip")
    }
    cat("Zip file exists. Extracting.")
    unzip(zipfile="data/household_power_consumption.zip")
  }
  if(!dir.exists("graphs")) {
    dir.create("graphs")
  }
  
  # Load the data 
  #setwd('~/projects/ExploratoryDataAnalysis/project01/ExData_Plotting1')
  
  if(!exists("powDat")) {
    powerDat <- read.table('data/household_power_consumption.txt', sep=';',
                       header = T, stringsAsFactors = F) # 2075259 rows
  }

  # Convert Date and Time variables to Date/Time classes in R using 
  # strptime()
  dateTime <- strptime(paste(powerDat$Date, powerDat$Time, sep=" "), 
                      format="%d/%m/%Y %H:%M:%S")
  powerDat$DateTime <- dateTime

  # Subset from 2007-02-01 to 2007-02-02
  startDate <- strptime("2007-02-01", format="%Y-%m-%d")
  endDate <- strptime("2007-02-03", format="%Y-%m-%d")

  powDatsub <- powerDat[powerDat$DateTime >= startDate # 1441 rows
                        & powerDat$DateTime < endDate,]

  powDatsub <- powDatsub[,-(1:2)] # drop Date and Time variables

  # Convert missing data values of '?' to NA
  NAs <- powDatsub == "?" # Make index of instances of "?"
  powDatsub[NAs] <- NA # convert "?" to NA
  powDatsubNA <- na.omit(powDatsub)
  
  #powDatsubNA <- powDatsubNA[complete.cases(powDatsubNA),]
  
  # Convert to numeric
  powDatsubNA[,1:7] <- as.numeric(unlist(powDatsubNA[,1:7]))
  
  return(powDatsubNA)
}