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
print("Choose the first file")
file_loc <- file.choose()
df <- read_excel(file_loc)
choice <- readline("Do you want to add more files.\n 1. Yes \n 2. No")
while(choice=="1"){
  print("Please choose the next file")
  file_loc <- file.choose()
  df2 <- read_excel(file_loc)
  df <- rbind(df,df2)
  choice <- readline("Do you want to add more files.\n 1. Yes \n 2. No")
  }
organization_code <- readline("Which organisation code do you want to keep")
df <- df[df$`Primary Academic Organization Code`==organization_code,]
df <- unique(df)
print("Files have been combined and duplicates have been removed")
outputFilename <- paste("Output_Term_Enrollment",today(),".xlsx",sep="")
write.xlsx(df,outputFilename)