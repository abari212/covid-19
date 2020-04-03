# spread tracking of covid-19
###########
setwd("D:/covid-19/") # as a working directory to store, prepare and analyse data

###########
# load libraries to process and display the results 
# Prior to loading process, check for installed packages before running install.packages() 
## pkg refers to package
requiredPackages = c('plyr','ggplot2','gganimate')
for(pkg in requiredPackages){
  if(!require(pkg,character.only = TRUE)) install.packages(pkg)
  library(pkg,character.only = TRUE)
}
###########
# Once installed launch the libraries
library(dplyr) # prepare and process data
library(ggplot2) # display data on a plot 
library(leaflet) # display data on a map
library(gganimate) # animatation of display  data
# library(gifski) optional for overlapping on image/raster data sets

###########
## Uploading and preparing datasets including image/raster datasets for simulation
## Datasets - (e.g. covid19_data)
# merging two files:
file (a) on incidence  
file (b) on location 
# merge two dataframes by ID
file_a <- read.table(file.choose(), header=TRUE, sep=",")
file_b <- read.table(file.choose(), header=TRUE, sep=",")

# In the case of WHO data sets available at this GitHub
file_a <- read.csv("https://raw.githubusercontent.com/abari212/covid-19/master/covid19_by_country_csv_2020.csv")
file_b <- read.csv("https://raw.githubusercontent.com/abari212/covid-19/master/country_google_csv.csv")
dim(file_a)
dim(file_b)

dataset <- merge(file_a,file_b,by="country")

########### list variables in the merged file
names(dataset)
head(dataset)
# longitude (x)
# latitude (y)
# Time (per day or per hour)

dataset$x <- dataset$longitude
dataset$y <- dataset$latitude
meanx <- mean(dataset$x)
meany <- mean(dataset$y)
minx <- min(dataset$x)
miny <- min(dataset$y)
maxx <- mean(dataset$x)
maxy <- mean(dataset$y)

# Dispay of spread geographically and over time (day or hour)

spread <- ggplot(
  dataset, 
  aes(x = dataset$x, y=dataset$y, size = dataset$confirmed_cases, colour = dataset$country)
) +
  geom_point(show.legend = FALSE, alpha = 1) +
  scale_color_viridis_d() +
  scale_size(range = c(0, 70)) +
  labs(x = "Longitude", y = "Latitude")

spread

# Transition through time 

spread <- spread + transition_time(dataset$day) + labs(title = "Time (Day): {frame_time}")

anim_save("spread.gif", spread)

######

# To be continued...

spread_w <- ggplot() +
  geom_path(data = world_map_df, aes(x = long, y = lat, group = group, colour ="grey")) + 
  coord_fixed() + 
  labs(title = "Covid-19 Spread",
       subtitle = "Covid-19 worldwide spread as of 21 Jan to 31 Mar, 2020",
       x = "", y = "") + # cause we don't need x and y labels do we? 
  geom_point(data = dataset, aes(x = dataset$x, y = dataset$y,  size= 10*dataset$confirmed_cases, colour ="orange")) +
  theme_bw()

spread_w <- spread_w + transition_time(dataset$day) + labs(title = "Time (Day): {frame_time}")

spread_w

anim_save("spread_w.gif", spread_w)


