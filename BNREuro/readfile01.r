# Utilizarea interfetei grafice pentru selectarea filei
fname <- file.choose()
# Functia incarca fila selectata in DataFrame
readCsvData <- function(filename){
  readData <- read.csv2(filename, header = TRUE,
                        row.names=DATA, dec = ",", sep=";")
  print(readData)
}

readCsvData(fname)
