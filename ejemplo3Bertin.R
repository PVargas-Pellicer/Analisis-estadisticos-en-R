
edidiv <- read.csv("C:/Users/berti/Desktop/curso analisis R/edidiv.csv")
View(edidiv)
head(edidiv) #Muestra las primeras filas de database
tail(edidiv) #muerstra las ultimas filas database
str(edidiv) #muestra la estructura de las variable (entero, continuo, categorico, caracter)
head(edidiv$taxonGroup)
class(edidiv$taxonGroup)
edidiv$taxonGroup <- as.factor(edidiv$taxonGroup) #cambie la columna taxongroup de caracter a factor
class(edidiv$taxonGroup)
edidiv$year <-as.factor(edidiv$year) #cambie la columna year de caracter a factor
class(edidiv$year)  #verifico que se aplico cambio
Beetle <- filter(edidiv, taxonGroup == "Beetle") #con esto filtro unicamente los resultados de Beetle y formo ese grupo nuevo
Bird <- filter(edidiv, taxonGroup == "Bird")
Butterfly <- filter(edidiv, taxonGroup == "Butterfly")
Dragonfly <- filter(edidiv, taxonGroup == "Dragonfly")
Flowering.Plants <- filter(edidiv, taxonGroup == "Flowering.Plants")
Fungus <- filter(edidiv, taxonGroup == "Fungus")
Hymenopteran <- filter(edidiv, taxonGroup == "Hymenopteran")
Lichen <- filter(edidiv, taxonGroup == "Lichen")
Liverwort <- filter(edidiv, taxonGroup == "Liverwort")
Mammal <- filter(edidiv, taxonGroup == "Mammal")
Mollusc <- filter(edidiv, taxonGroup == "Mollusc")  # y asi filtre la tabla con todos los grupos de animales que hay en la base
a <- length(unique(Beetle$taxonName))
b <- length(unique(Bird$taxonName))
c <- length(unique(Butterfly$taxonName)) #aqui estamos calculando la riqueza de especies, especies dif. para cada grupo
d <- length(unique(Dragonfly$taxonName))
e <- length(unique(Flowering.Plants$taxonName))
f <- length(unique(Fungus$taxonName))
g <- length(unique(Hymenopteran$taxonName))
h <- length(unique(Lichen$taxonName))
i <- length(unique(Liverwort$taxonName))
j <- length(unique(Mammal$taxonName))  # asi por ejemplo el grupo j me dice que hay 33 especies diferentes de mamiferos
k <- length(unique(Mollusc$taxonName))
biodiv <- c(a,b,c,d,e,f,g,h,i,j,k)
names(biodiv) <- c("Beetle","Bird","Butterfly","Dragonfly","Flowering.Plants","Fungus","Hymenopteran","Lichen","Liverwort","Mammals","Mollusc")
barplot(biodiv) #con esto hago la grafica de barras de biodiv. con sus nombres que puse aqui arriba
png("barplot.png", width = 1600, height = 600) #esto para guardar mi grafica en mi directorio
barplot(biodiv, xlab = "Taxa", ylab = "Number of species", ylim = c(0,600), cex.names = 1.5, cex.axis = 1.5, cex.lab=1.5)
dev.off() #con esto cerre la grafica, pero no se a donde se fue
getwd() #esto me dice cual es mi directorio de trabajo, a donde envia mis archivos para guardar

#crear una base de datos

taxa <- c("Beetle", "Bird",
          "Butterfly",
          "Dragonfly",
          "Flowering.Plants",
          "Fungus",
          "Hymenopteran",
          "Lichen",
          "Liverwort",
          "Mammal",
          "Mollusc")

#cambiar el objeto taxa a una variable catergorica llamada taxa_f

taxa_f <- as.factor(taxa)

biodata <- data.frame(taxa_f, richness) #me marca error porque aun no tengo el objeto llamado richness

richness <- c(a,b,c,d,e,f,g,h,i,j,k)

biodata <- data.frame(taxa_f, richness) #cree la base de datos con los dos factores taxa f y richness

write.csv(biodata, file = "biodata.csv")

barplot(biodata$richness, names.arg= c("Beetle", "Bird",
                                      "Butterfly",
                                      "Dragonfly",
                                      "Flowering.Plants",
                                      "Fungus",
                                      "Hymenopteran",
                                      "Lichen",
                                      "Liverwort",
                                      "Mammal",
                                      "Mollusc"),
        xlab="Taxa", ylab="Number of species", ylim=c(0,600))  #no veo la grafica ???
dev.off()
getwd()

#EJERCICIO


Bird_sp <- c("sparrow","kingfisher", "eagle", "hummingbird", "sparrow", "kingfisher", "eagle", "hummingbird", "sparrow", "kingfisher", "eagle", "hummingbird")
Bird_sp  <- as.factor(Bird_sp)
wingspan <- c(22, 26, 195, 8, 24, 23, 201,9, 21, 25, 185, 9)
class(wingspan)
wingspan <- as.numeric(wingspan)
envergadura <- data.frame(Bird_sp, wingspan)
write.csv(envergadura, file="envergadura.csv")
barplot(envergadura$wingspan, names.arg= c("sparrow", "kingfisher",
                                          "eagle",
                                          "hummingbird", "sparrow", "kingfisher",
                                          "eagle",
                                          "hummingbird","sparrow", "kingfisher",
                                          "eagle",
                                          "hummingbird"),
        xlab="Bird Type", ylab="wingspan lenght (cm)", ylim=c(0,210))

Birdsp <- c("sparrow","kingfisher", "eagle", "hummingbird")
Birdsp  <- as.factor(Bird_sp)

str(envergadura)
View(envergadura)

s <- mean(22,24,21)
s
class(s)
k <- mean(26,23,25)
e <- mean(195,201,185)
e
h <- mean(8,9,9)
h
Xwingspan <- c(s,k,e,h)
class(Xwingspan)
Xenvergadura <- data.frame(Birdsp, Xwingspan)
write.csv(Xenvergadura, file="Xenvergadura.csv")
View(Xenvergadura)
barplot(Xenvergadura$Xwingspan, names.arg= c("sparrow", "kingfisher", "eagle","hummingbird")
        xlab="Bird Type", ylab="Xwingspan lenght (cm)", ylim=c(0,210))
