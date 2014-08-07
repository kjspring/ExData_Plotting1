# Plot 1 Frequency of global active power
# Filename: plot1.R
# Exploratory Data Analysis
# Kevin Spring
# 2014-08-06
###############################################################################

# For each plot
## Construct the plot and save as a PNG of 480x480 pixels
## Name each plot files as plotX.png, where X is the plot number.
## Create a sperate code file, plotX.R, where X is the plot number.
### Should include code for reading the data so the plot can be fully reproduced.
### and includes creating the PNG file.
## Add the PNG file and R code to your git repository

source('scripts/loading.R')
if(!exists("powDatSub")) {
  powDatSub <- loading()
}

plot1 <- function(powDatSub=powDatSub) {
  
  png(filename='graphs/plot1.png', width=480, height=480, units='px')
  with(powDatSub, hist(Global_active_power, 
                       col=c("red"),
                       main="Global Active Power",
                       xlab="Global Active Power (kilowatts)"))
  dev.off()
  
}


