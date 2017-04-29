executePlot3 <- function() {
  
  print("Process graphic 03")
  
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
  library(ggplot2)
  png(filename = "figure/plot3.png", width = 480, height = 480, units = "px")
  g <- ggplot(subdataset, aes(year, Emissions, color = type))
  g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total Emissions in Baltimore City from 1999 to 2008")
  
  dev.off()
  
}	
