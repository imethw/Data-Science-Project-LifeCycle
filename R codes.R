#SUPPORT
library(readxl) 

data <- read_excel("C:\\Users\\Admin\\Downloads\\cleaned_dataset.xlsx")
data

# Calculate support for each attribute
support <- lapply(data, function(x) {
  counts <- table(x)  
  support <- prop.table(counts)  
  return(support)
})

# Print support for each attribute
print(support)


#CONFIDENCE

library(dplyr)

numeric_data <- data %>% select_if(is.numeric)

# Calculate confidence intervals for the mean of each numeric variable
confidence_intervals <- sapply(numeric_data, function(x) {
  result <- t.test(x)
  return(result$conf.int)
})

print(confidence_intervals)

