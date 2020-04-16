#Data inlezen
mijnDataSnelheid <- read.csv(file.choose())
mijnDataRuimte <- read.csv(file.choose())
data <- mijnData

colors = c("red", "orange")

#barplot ruimte in megebyte
barplot(mijnDataRuimte$Ruimte, names.arg = mijnDataRuimte$Type, main = "Snelheid resultaat", xlab = "Type applicatie", ylab = "Ruimte in megabyte", col = colors)

# boxplot snelheid
PWA_score <- c(mijnDataSnelheid$Uitvoeringstijd[mijnDataSnelheid$Type=="PWA"]) #count 99
App_score <- c(mijnDataSnelheid$Uitvoeringstijd[mijnDataSnelheid$Type=="Native app"]) #count 99
boxplot(App_score, PWA_score,names = c("Native App", "PWA") , main="Snelheidsanaylse",ylab="Tijd in seconden", xlab="Type applicatie", col = "skyblue")
