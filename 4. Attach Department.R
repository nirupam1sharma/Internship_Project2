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
if(!require("sqldf")){
  install.packages("sqldf")
  library(sqldf)
}
print("Select the main extract file")
fileloc <- file.choose()
df1 <- read_excel(fileloc)
print("Select the department file")
fileloc <- file.choose()
df2 <- read_excel(fileloc)
result <- sqldf("SELECT df1.*, df2.`Department Code` as 
                Department from df1 left join df2 on 
                df1.`Primary Academic Plan Code` = df2.'Primary Academic Plan Code'")
outputFilename <- paste("Final_Term_Enrollment",today(),".xlsx",sep="")
write.xlsx(result,outputFilename)