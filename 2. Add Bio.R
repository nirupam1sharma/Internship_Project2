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
df <- df[,c("Emplid","First Generation","Campus eMail",
            "Military Duty Status","City","State","Postal")]
choice <- readline("Do you want to add more files.\n 1. Yes \n 2. No")
while(choice=="1"){
print("Please choose the next file")
file_loc <- file.choose()
df2 <- read_excel(file_loc)
df2 <- df2[,c("Emplid","First Generation","Campus eMail",
             "Military Duty Status","City","State","Postal")]
df <- rbind(df,df2)
choice <- readline("Do you want to add more files.\n 1. Yes \n 2. No")
}
df <- unique(df)
print("Files have been combined and duplicates have been removed")
outputFilename <- paste("Output_Bio",today(),".xlsx",sep="")
write.xlsx(df,outputFilename)