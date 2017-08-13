# Citirea filei export.csv in spatiul de lucru al R

# citirea directorului curent
print(getwd())

readData <- read.csv2(file="export.csv",header = TRUE,
                      row.names=DATA, dec = ",", sep=";")
#readData1 <- gsub(pattern = ',',replace =  '.',x= readData, fixed = TRUE)
print(readData)
print(is.data.frame(readData))
#print(ncol(readData)
#print(nrow(readData))

leuEUR <- as.vector(c(readData$LEU.EUR))
print(leuEUR)
DATA <-as.character(readData$DATA)

print(DATA)
#Fila unde este salvat graficul
png(file="plot_leuEUR.png")

plot(leuEUR, type = "o", xlab="Lunile iul.2017 - ian.2005",
     ylab="Cursul Leu/Euro", main="Cursul mediu lunar 2017-2005")
dev.off()

an2017 <- leuEUR[c(1:7)]
print(an2017)
an2016 <- leuEUR[c(8:19)]
print(an2016)
an2015 <- leuEUR[c(20:31)]
print(an2015)
an2014 <- leuEUR[c(32:43)]
print(an2014)
an2013 <- leuEUR[c(44:55)]
print(an2013)
png(file="anLeuEur.png")
plot(an2014, type = "o")
lines(an2017, type = "o", col="red")
lines(an2015, type = "o", col="green")
lines(an2016, type = "o", col="blue")
lines(an2013, type="o", col="magenta")
dev.off()

an2012 <- leuEUR[c(56:67)]
print(an2012)
mean_an2012 <- mean(an2012)
print(mean_an2012)
png(file="an2012.png")
plot(an2012, type="o")
lines(mean_an2012, type="o", col="green")
dev.off()

mean(an2012)
# -----------------------------------------------
# Regresia liniara in R
# http://statisticasociala.tripod.com/regresie.htm
# y=ax +b
# y - este variabila raspuns
# x - este variabila predictor
# a si b - sunt constante denumite coeficienti
#-------------------------------------------------
relatia <- lm(an2016~an2015)
print(relatia)
print(summary(relatia))
a <- data.frame(an2016 = 4.395)
result <- predict(relatia, a)
print(result)

png(file="regresieliniara.png")
plot(an2016, an2015, col="blue", main = "an2016 si an2015 cu regresie liniara",
     abline(lm(an2016~an2015)), cex = 2.3, pch =16, xlab="an2016",
     ylab = "an2015")
dev.off()