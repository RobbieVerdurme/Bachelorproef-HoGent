#Data inlezen
mijnDataRuimte <- read.csv(file.choose())

#colors
colors = c("skyblue", "orange")


###### CACHED REQUIRED SPACE
# barplot ruimte no cache
nocachedBarplot <- barplot(mijnDataRuimte$No_cached, names.arg = mijnDataRuimte$ï..Type, main = "Benodigde ruimte", xlab = "Type applicatie", ylab = "Ruimte in Megabyte", ylim= c(0,8), col = colors)
text(nocachedBarplot, mijnDataRuimte$No_cached + .2, mijnDataRuimte$No_cached, cex= .8)

# barplot ruimte cache
cachedBarplot <- barplot(mijnDataRuimte$Cached, names.arg = mijnDataRuimte$ï..Type, main = "Benodigde ruimte", xlab = "Type applicatie", ylab = "Ruimte in Megabyte", ylim= c(0,8), col = colors)
text(cachedBarplot, mijnDataRuimte$Cached + .2, mijnDataRuimte$Cached, cex= .8)

###### REQUIRED SPACE PER TYPE
## CONFIGURATION
df2 <- data.frame(t(mijnDataRuimte[-1]))
colnames(df2) <- df[,1]

## PWA
# X2 => PWA
# barplot cached no cached PWA
PWACachedNoCached <- barplot(df2$X2,names.arg = c("Niet cached","Cached"), main="Benodigde ruimte PWA",ylab="Ruimte in megabyte PWA", xlab="Data",ylim=c(0,8),  col = colors[2])
text(PWACachedNoCached, df2$X2 + .2, df2$X2, cex= .8)

## APP
# X1 => Native app
# barplot cached no cached App
NativeAppCachedNoCached <- barplot(df2$X1,names.arg = c("Niet cached","Cached"), main="Benodigde ruimte Native app",ylab="Ruimte in megabyte Native App", xlab="Data",ylim=c(0,8),  col = colors[1])
text(NativeAppCachedNoCached, df2$X1 + .2, df2$X1, cex= .8)

###### SPEED TIMES
##  CONFIGURATION
mijnDataFilter <- read.csv(file.choose())
mijnDataMenu <- read.csv(file.choose())

## FILTER TEST (PWA, OFFLINE PWA, NATIVE APP)
boxplot(mijnDataFilter$ï..PWA, mijnDataFilter$Offline.PWA, mijnDataFilter$Native.App, main="Vind menu test",names = c("PWA", "Offline PWA", "Native App"), ylim = c(2,4.5), xlab="Tijd",horizontal=TRUE, col= c("skyblue","skyblue", "orange"))

## DETAIL MENU TEST
boxplot(mijnDataMenu$ï..PWA, mijnDataMenu$Offline.PWA, mijnDataMenu$Native.App, main="Detail menu test",names = c("PWA", "Offline PWA", "Native App"), ylim = c(2,4.5), xlab="Tijd",horizontal=TRUE, col= c("skyblue","skyblue", "orange"))

## FILTERTEST PWA VS OFFLINE PWA
boxplot(mijnDataFilter$ï..PWA, mijnDataFilter$Offline.PWA, main="Vind menu test PWA",names = c("PWA", "Offline PWA"), ylim = c(2,4.5), xlab="Tijd",horizontal=TRUE, col= c("skyblue","skyblue"))

## DETAIL MENU TEST PWA VS OFFLINE PWA
boxplot(mijnDataMenu$ï..PWA, mijnDataMenu$Offline.PWA, main="Menu test PWA",names = c("PWA", "Offline PWA"), ylim = c(2,4.5), xlab="Tijd",horizontal=TRUE, col= c("skyblue","skyblue"))

###### SPEED TIMES STATISTIC TABLE
## PWA
summary(mijnDataFilter$ï..PWA)
summary(mijnDataMenu$ï..PWA)

sd(mijnDataFilter$ï..PWA) # 0.3643147
sd(mijnDataMenu$ï..PWA) # 0.2424087

## OFFLINE PWA
summary(mijnDataFilter$Offline.PWA)
summary(mijnDataMenu$Offline.PWA)

sd(mijnDataFilter$Offline.PWA) # 0.251525
sd(mijnDataMenu$Offline.PWA) # 0.3831836

## NATIVE APP
summary(mijnDataFilter$Native.App)
summary(mijnDataMenu$Native.App)

sd(mijnDataFilter$Native.App) # 0.1931433
sd(mijnDataMenu$Native.App) # 0.07704861

