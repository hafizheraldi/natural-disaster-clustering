library(tidyverse)
library(cluster)
library(factoextra)

#input data tanpa nama provinsi
data <- Data_Bencana_2018_Rasio_Tanpa_Prov_
str(data)
head(data)
data1 <- na.omit(data)
datafix <- scale(data1)

#input data nama provinsi
namaprov = Data_Bencana_2018_Rasio_$`Nama Provinsi`
row.names(datafix)=c(namaprov)
fviz_nbclust(datafix, kmeans, method = "wss")

set.seed(123)
final <- kmeans(datafix, 4, nstart = 25)
final
fviz_cluster(final, data=datafix)

