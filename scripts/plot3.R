# Plot 3: Energy consumption by sub metering over 2 days
# Filename: plot3.R
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

plot3 <- function(powDatSub=powDatSub) {
  png(filename='graphs/plot3.png', width=480, height=480, units='px')
  with(powDatSub, plot(DateTime, Sub_metering_1,
                       type="l",
                       ylab="Global Active Power (kilowatts)",
                       xlab=""))
  with(powDatSub, lines(DateTime, Sub_metering_2, col="red"))
  with(powDatSub, lines(DateTime, Sub_metering_3, col="blue"))
  # add a legend
  leg_names <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  legend(x="topright",legend=leg_names, col=c("black", "red", "blue"))
  
  dev.off()
}