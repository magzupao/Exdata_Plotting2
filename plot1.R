executePlot1 <- function() {
  
  print("Process graphic 01")
  
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

  png(filename = "figure/plot1.png", width = 480, height = 480, units = "px")
  totalEmissions <- aggregate(summaryData$Emissions, list(summaryData$year), FUN = "sum")
  plot(totalEmissions, type = "l", xlab = "Year", main = "Total Emissions in the United States from 1999 to 2008", ylab = expression('Total PM'[2.5]*" Emission"))  
  dev.off()
  
}	
