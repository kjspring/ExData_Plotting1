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

# You must be in the ExData_Plotting1 directory for scripts to work

# All plots are saved in the graphs directory

source('scripts/loading.R') # loads the script to input and subset the data

if(!exists("powDatSub")) {
  powDatSub <- loading()
}

plot2 <- function(dat) {
  png(filename='graphs/plot2.png', width=480, height=480, units='px')
  with(dat, plot(DateTime, Global_active_power,
                       type="l",
                       ylab="Global Active Power (kilowatts)",
                       xlab=""))
  dev.off()
}

plot2(powDatSub) # runs the plot
