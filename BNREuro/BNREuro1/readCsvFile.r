## ==================================================================
## Descarcarea de file de cod din Rstudio
## Author: Mihai Cornel   mhcrnl@gmail.com
## File:  readCsvFile.r
## Data: 13.08.2017
## Resurse : https://www.r-bloggers.com/getting-data-from-an-online-source/
##    https://www.programiz.com/r-programming/examples/simple-calculator
## ==================================================================

## --------------------------------------------------------

## --------------------------------------------------------
readCsvFile <- function(){
  # Afiseaza directorul curent in care ruleaza programul
  print(getwd())
  # Deschide GUI pentru alegera filei
  myFile <- file.choose()
  readData <- read.csv2(myFile,
                        header = TRUE,
                        #row.names=DATA,
                        dec = ",",
                        sep=";")
  print(readData)
}
## ------------------------------------------------------
## Citeste in GUI fila 
## ------------------------------------------------------
plotLeuEuro <- function(){
  # Transformarea datelor citite in vector
  leuEUR <- as.vector(c(readData$LEU.EUR))
  print(leuEUR)
  #Fila unde este salvat graficul
  png(file="plot_leuEUR.png")
  # Crearea graficului
  plot(leuEUR, type = "o", xlab="Lunile iul.2017 - ian.2005",
       ylab="Cursul Leu/Euro", main="Cursul mediu lunar iul.2017-ian.2005")
  # Salvarea graficului
  dev.off()
}
## ----------------------------------------------------------------
## Meniul aplicatiei 
## ----------------------------------------------------------------
meniu <- function(){
  print("Alegeti o optiune din urmatoarele valori: ")
  print("1. Citirea filei csv in meniu GUI.")
  print("2. Afisati meniul.")
  print("3. Rulati inca o data programul.")
  print("4. Creati grafic plot 2017-2005.")
  print("5. Inchideti aplicatia.")
}
## ---------------------------------------------------------------
## Functia in care ruleaza programul
##----------------------------------------------------------------
runProgram <- function(){
  meniu()
  choice = as.integer(readline(prompt = "Introduceti o valoare[1/2/3/4/5]: "))
  switch(choice,readCsvFile(), meniu(), runProgram(),plotLeuEuro(), quit())
}

runProgram()



