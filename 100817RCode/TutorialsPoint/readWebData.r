#install.packages("data.table")
library(data.table)

mydat <- fread("apr2017.csv")
print(mydat)
help(fread)