# Importar la base de datos de Edinburgo disponible en NBN Gateway https://data.nbn.org.uk/

# Agrega un encabezado informativo

# Agrega paquetes

# Importat base de datos

# Checa tu base de datos antes de empezar
Head(edidiv)
tail(edidiv)
str(edidiv)
dim(edidin)
summary(edidiv)

# Crear un vector que enliste cuantas especies de cada taxa se han registrado en Edimburgo
# Filtramos la informacion apra cada taxon y contamos las especies unicas

Beetle <- filter(edidiv taxonGroup == "Beetle")
Bird <- filter(edidiv, taxonGroup = "Bird")
Butterfly <- filter(edidiv, taxonGroup == "Buterfly")
FloweringPlants <- filter(edidiv, taxonGroup == "Flowering.Plants")
Fungus <- filter(edidiv, taxonGroup == "Fungus")
Hymenopteran <- filter(edidiv, taxonGroup == "Hymenopteran")
Lichen <- filter(edidiv, taxonGroup == "Lichen")
Liverwort <- filter(edidiv, taxonGroup == Liverwort")
Mammal <- filter(edidiv, taxonGroup == "Mammal")
Mollusc <- filter(edidiv, taxonGroup == "mollusc"))

# Las siguientes dos funciones nos drian cuantas especies de cada taxon

a <- length(unique(Beetle$taxonName))
b <- length(unique(Bird$taxonName))
c <- length(unique(Butterfly$taxonName))
d <- length(unique(Dragonfly$taxonName))
e <- length(unique(Flowering.Plants$taxonName))
f <- length(unique(Fungus$TaxonName))
g <- length(unique(Hymenopteran$taxon.Name))
h <- length(unique(Lichen$taxonName))
i <- length(unique(Liverwort$taxonName))
j <- length(unique(Mammal$taxonname))
k <- length(unique(Mollusc$taxonName))

# Podemos ahora combinar los objetos en un vector y agregando los nombres
biodiv <- (a,b,c,d,e,f,g,h,i,j,k)
names(biodiv) <- c("Beetle", 
                   "Bird", 
                   "Butterfly", 
                   "Dragonfly", 
                   "Fl.Plants", 
                   "Fungus", 
                   "Hymenopteran", 
                   "Lichen", 
                   "Liverwort", 
                   "Mammal", 
                   "Mollusc")

# Ahora que tenemos los vaores, los podemos visualizar
barplot(as.matrix(biodiv))

# Agrega un titulo a la grafica
# Haz que todos los nombres de las columnas sean visibles
# Modifica los limites de los ejes

# Y ahora la guardamos
png("barplot.png", width=950, height=500)
barplot(biodiv, xlab="Taxa" ylab="Number of species", ylim=c(0,900), cex.axis=1.5, cex.lab=1.5)
dev.off()

# Ahora haz una base de datos

taxa <- c("Beetle", 
          "Bird", 
          "Butterfly", 
          "Dragonfly", 
          "Fl.Plants", 
          "Fungus", 
          "Hymenopteran", 
          "Lichen", 
          "Liverwort", 
          "Mammal", 
          "Mollusc")
taxa_f <- factor(taxa)
richness <- c(a,b,c,d,e,f,g,h,i,j,k)
biodata <- data.frame(taxaf, richness)
write.csv(biodata, file="biodata.csv")

# Ahora haz la misma grafica, pero usando la base de datos, no el vector 
png("barplot2.png", width=950, height=500)
barplot(biodata$richness, names.arg=c("Beetle", 
                                      Bird",, 
                                      "Butterfly", 
                                      "Dragonfly", 
                                      "Fl.Plants", 
                                      "Fungus", 
                                      "Hymenopteran", 
                                      "Lichen", 
                                      "Liverwort", 
                                      "Mammal", 
                                      "Mollusc")),
        xlab=Taxa", ylab="Number of species", ylim=c(0,600), cex.axis=1.5, cex.lab=1.5)
dev.off()
