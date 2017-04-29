executePlot6 <- function() {
  
  print("Process graphic 06")
  
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

subdataset <- summaryData[summaryData$fips == "24510"|summaryData$fips == "06037", ]
library(ggplot2)
png(filename = "./figure/plot6.png", width = 480, height = 480, units = "px", bg = "transparent")
motor <- grep("motor", clasificationData$Short.Name, ignore.case = T)
motor <- clasificationData[motor, ]
motor <- subdataset[subdataset$SCC %in% motor$SCC, ]

g <- ggplot(motor, aes(year, Emissions, color = fips))
g + geom_line(stat = "summary", fun.y = "sum") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle("Comparison of Total Emissions From Motor\n Vehicle Sources in Baltimore City\n and Los Angeles County from 1999 to 2008") +
    scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore"))
dev.off()
  
}	
