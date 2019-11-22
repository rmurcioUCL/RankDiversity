setwd("~/Documents/RankDiversity")
coords <- read.csv2("maps/cities_coord_type.csv", sep=";")[,1:3]
head(coords)

epoch <- read.csv2("results/rankDiversity/subsetEpoch.csv", sep=",")
head(epoch)

countries <- colnames(epoch)
epochcities <- data.frame()
#c <- countries[2]
i <- 0
for (c in countries){
  i <- i + 1
  ccities <- data.frame()
  lc <- epoch[,c]
  l <- lc[!is.na(lc) & lc != ""]
  n <- length(l)
  ccities[1:n,"city"] <- l
  ccities[1:n,"country"] <- c
  ccities[1:n,"type"] <- "epoch"
  if(i == 1){ epochcities <- ccities} else {
    epochcities <- rbind(epochcities, ccities)
  }
}
epochcitiescoord <- data.frame(epochcities,coords[match(epochcities$city,coords$name),])
summary(epochcitiescoord)
write.csv2(epochcitiescoord,"maps/subset_epoch.csv")


######@

epoch <- read.csv2("results/rankDiversity/subsetEpochSmaller.csv", sep=",")
head(epoch)

countries <- colnames(epoch)
epochcities <- data.frame()
#c <- countries[2]
i <- 0
for (c in countries){
  i <- i + 1
  ccities <- data.frame()
  lc <- epoch[,c]
  l <- lc[!is.na(lc) & lc != ""]
  n <- length(l)
  ccities[1:n,"city"] <- l
  ccities[1:n,"country"] <- c
  ccities[1:n,"type"] <- "epochSmaller"
  if(i == 1){ epochcities <- ccities} else {
    epochcities <- rbind(epochcities, ccities)
  }
}
epochcitiescoord <- data.frame(epochcities,coords[match(epochcities$city,coords$name),])
summary(epochcitiescoord)
write.csv2(epochcitiescoord,"maps/subset_epochSmaller.csv")

