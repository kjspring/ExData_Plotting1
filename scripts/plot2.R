# Plot 2: Global Active Power over Thursday and Friday
# Filename: plot2.R
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

plot2 <- function(powDatSub=powDatSub) {
  png(filename='graphs/plot2.png', width=480, height=480, units='px')
  with(powDatSub, plot(DateTime, Global_active_power,
                       type="l",
                       ylab="Global Active Power (kilowatts)",
                       xlab=""))
  dev.off()
}