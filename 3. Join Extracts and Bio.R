if(!require("xlsx")){
  install.packages("xlsx")
  library(xlsx)
}
if(!require("readxl")){
  install.packages("readxl")
  library(readxl)
}
if(!require("lubridate")){
  install.packages("lubridate")
  library(lubridate)
}
if(!require("rJava")){
  install.packages("rJava")
}
# We convert the files into single output resultant one
print("Choose the Extracts file")
file1_loc <- file.choose()
df1 <- read_excel(file1_loc)
print("Choose the Bio file")
file2_loc <- file.choose()
df2 <- read_excel(file2_loc)
result=merge(x = df1,y=df2,by="Emplid",all.x =T)
outputFilename <- paste("Combined Result",today(),".xlsx",sep="")
write.xlsx(result,outputFilename,row.names = F)
print("Files joined and output saved")