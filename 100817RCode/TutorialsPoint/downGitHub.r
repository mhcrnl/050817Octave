## ==================================================================
## Descarcarea de file de cod din Rstudio
## Author: Mihai Cornel   mhcrnl@gmail.com
## File:  downGitHub.r
## Data: 13.08.2017
## Resurse : https://www.r-bloggers.com/getting-data-from-an-online-source/
## ==================================================================

## ------------------------------------------------------------------
## Functia care descarca file de pe internet
## ------------------------------------------------------------------
downloadFile <- function(){
  # Citirea in consola a adresei web
  url <-readline(prompt = "Intruduce-ti adresa filei: ")
  print(url)
  # Numele filei in care va fi salvat continutul
  filename <- readline(prompt = "Introduceti numele filei: ")
  print(filename)
  # Descarcarea filei de pe internet si salvarea acesteia
  download.file(url, filename)
  # Deschiderea filei in workspace
  file.edit(filename)
}
## ----------------------------------------------------------------
## Meniul aplicatiei 
## ----------------------------------------------------------------
meniu <- function(){
  print("Alegeti o optiune din urmatoarele valori: ")
  print("1. Download a fila cu functia download.file si salvare.")
  print("2. Afisati meniul.")
  print("3. Rulati inca o data programul.")
  print("5. Inchideti aplicatia.")
}
## ---------------------------------------------------------------
## Functia in care ruleaza programul
##----------------------------------------------------------------
runProgram <- function(){
  meniu()
  choice = as.integer(readline(prompt = "Introduceti o valoare[1/2/3/4/5]: "))
  switch(choice,downloadFile(), meniu(), runProgram(), quit())
}

runProgram()



