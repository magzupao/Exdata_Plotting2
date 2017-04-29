executePlot2 <- function() {
  
  print("Process graphic 02")
  
  typeClass <- class(summaryData)
  if(typeClass == "data.frame"){  
    if(nrow(summaryData) > 1){
      print(" .... ")
    }else{
      print(" refresh data ... ")
      source('load_data.R')
    }      
  }else{
    print(" load data ... ")
    source('load_data.R')    
  }  

  subdataset <- summaryData[summaryData$fips == "24510", ] 
  png(filename = "figure/plot2.png", width = 480, height = 480, units = "px")
  totalEmissions <- aggregate(subdataset$Emissions, list(subdataset$year), FUN = "sum")
  plot(totalEmissions, type = "l", xlab = "Year", main = "Total Emissions in Baltimore City from 1999 to 2008", ylab = expression('Total PM'[2.5]*" Emission"))

  dev.off()
  
}	
