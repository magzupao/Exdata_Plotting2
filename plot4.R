executePlot4 <- function() {
  print("Procesa graphic 04")
  
  typeClass <- class(clasificationData)
  if(typeClass == "data.frame"){  
    if(nrow(clasificationData) > 1){
      print(" .... ")
    }else{
      print(" refresh data ... ")
      source('load_data.R')
    }      
  }else{
    print(" load data ... ")
    source('load_data.R')    
  }  

png(filename = "figure/plot4.png", width = 480, height = 480, units = "px")
coal <- grep("coal", clasificationData$Short.Name, ignore.case = T)
coal <- clasificationData[coal, ]
coal <- summaryData[summaryData$SCC %in% coal$SCC, ]

coalEmissions <- aggregate(coal$Emissions, list(coal$year), FUN = "sum")
plot(coalEmissions, type = "l", xlab = "Year", main = "Total Emissions From Coal Combustion-related\n Sources from 1999 to 2008", ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()
  
}	
