executePlot5 <- function() {
  
  print("Process graphic 05")
  
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

subdataset <- summaryData[summaryData$fips == "24510", ] 
png(filename = "figure/plot5.png", width = 480, height = 480, units = "px")
motor <- grep("motor", clasificationData$Short.Name, ignore.case = T)
motor <- clasificationData[motor, ]
motor <- subdataset[subdataset$SCC %in% motor$SCC, ]
motorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")

plot(motorEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Motor Vehicle Sources\n from 1999 to 2008 in Baltimore City", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()
  
}	
