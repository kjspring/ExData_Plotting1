# Plot 4: Multiplot
# Filename: plot4.R
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

plot4 <- function(dat) {
  png(filename='graphs/plot4.png', width=480, height=480, units='px')
  par(mfrow = c(2,2))
  
  # Plot 1
  with(dat, plot(DateTime, Global_active_power,
                       type="l",
                       ylab="Global Active Power (kilowatts)",
                       xlab=""))
  
  # Plot 2
  with(dat, plot(DateTime, Voltage,
                       type="l",
                       xlab = "datetime",
                       ylab = "Voltage"))
  
  # Plot 3
  with(dat, plot(DateTime, Sub_metering_1,
                       type="l",
                       ylab="Global Active Power (kilowatts)",
                       xlab=""))
  with(dat, lines(DateTime, Sub_metering_2, col="red"))
  with(dat, lines(DateTime, Sub_metering_3, col="blue"))
  # add a legend
  leg_names <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  legend(x="topright",
         legend=leg_names, 
         col=c("black", "red", "blue"), 
         lty=c(1,1,1),
         bty="n")
  
  # Plot 4
  with(dat, plot(DateTime, Global_reactive_power,
                       type="l",
                       xlab = "datetime"))
  
  dev.off()
}

plot4(powDatSub) # runs the plot
