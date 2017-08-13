# Read the URL
url <- "http://www.geos.ed.ac.uk/~weather/jcmb_ws/JCMB_2017_Apr.csv"

# Gather the html links present in the webpage.
#links <- getHTMLLinks(url)
download.file(url,"apr2017.csv")
# Identificarea link-urilor care se refera la anul 2017
#filenames <- links[str_detect(links, "JCMB_2017")]

# Store the file names as a list.
filenames_list <- as.list(filenames)

# Create a function to download the files by passing the URL and filename list.
downloadcsv <- function (mainurl,filename) {
  filedetails <- str_c(mainurl,filename)
  download.file(filedetails,filename)
}

# Now apply the l_ply function and save the files into the current R working directory.
l_ply(filenames,downloadcsv,mainurl = "http://www.geos.ed.ac.uk/~weather/jcmb_ws/")