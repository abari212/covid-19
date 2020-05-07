This is an updated version from prevoius version of March 31st, 2020, more updates to follow.
-----------------------------------------------------------------------------------------------------------

###########################################################################################################
# Tracing, based on a privacy-preserving approach, and modeling the spread of covid-19 - OperAI 2020                                       #
# Main aim is to help to slow the spread of the virus and flatten its growth curve.                       #
# "Slowing the spread of the infection is nearly as important as stopping it", NY Times (27 March 2020).  #
# https://www.nytimes.com/article/flatten-curve-coronavirus.html                                          #
# https://time.com/5809038/coronavirus-flatten-curve/                                                     #
###########################################################################################################

# To start install R if not already installed 

# R is available to download and install to run on Windows, OS X and a wide variety of Unix platforms. 
# The primary part of R language is available from its Comprehensive R Archive Network (CRAN) - https://cran.r-project.org/
# Many add-on packages used to extend the functionality of R language are also hosted in the CRAN.
# On overall it consists of 2 conceptual parts:

# 1.	The "base" R part that can be download from CRAN: Linux, Windows or Mac. It consists of the most fundamental functions of R 
# 2.	The add on part with all other packages to carry out data preparation and data analytics such as class (classification), cluster, nlme (non-linear moldeling, rpart, 
                                                                                                                                           spatial (spatial analytics) and nnet (neural networks) for machine learning.
# R is becoming a de facto platform to develop and share mathematical scripts as well as data including spatial data.
############
# Create a directory 
###
# setwd("D:/covid-19/") # as a working directory to store, prepare and analyse data

###########
# Load libraries to process and display the results 
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
library(gganimate) # animation of display  data
# library(gifski) optional for laying the results output on image/raster data sets in a later stage

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

# Display of spread geographically and over time (day or hour)

spread <- ggplot(
  dataset, 
  aes(x = dataset$x, y=dataset$y, size = dataset$confirmed_cases, colour = dataset$country)
) +
  geom_point(show.legend = FALSE, alpha = 1) +
  scale_color_viridis_d() +
  scale_size(range = c(0, 70)) +
  labs(x = "Longitude", y = "Latitude")

spread

# Transition through time (here daily basis but it could also be on hourly basis)

spread <- spread + transition_time(dataset$day) + labs(title = "Time (Day): {frame_time}")

# anim_save("spread.gif", spread)

###################################
# Tracing and predicting the spread ahead 
# Detecting patterns and predictive modeling 

# The approch will be based on the assumption that nearby georeferenced locations (name), with covid-19 cases, are associated in some way as a result of their proximity in space and time. 
# It is likely that the data are linked some how either in space or time or both. 
# To create maps R module applied to irregularly spaced data where the correlation between thee geographical locationss is understood to be an exponential function of the distance, was used. 


##########################
# Display data on maps

library("ggplot2")
theme_set(theme_bw())
library("sf") # sf is a formal standard (ISO 19125-1:2004) way to represent spatial geometry (shape) of real objects in computers.

# For mapping purpose we could use different sources, such as ESRI map shape file 
# The package rnaturalearth provides such shape map files of countries for the entire world. 
# As a function "ne_countries" can be used to pull country data and choose the scale (rnaturalearthhires is necessary for scale = "large"). 
# The function can return sp classes (default) or directly sf classes, as defined in the argument returnclass.

library("rnaturalearth")
library("rnaturalearthdata")

world <- ne_countries(scale = "medium", returnclass = "sf")
class(world)

# Load the shape file data in three steps
# 
# step 1 - download the zip file
download.file("https://raw.githubusercontent.com/abari212/data/master/coastlines.zip", 
              destfile = 'coastlines.zip')

# step 2 - unzip the file
unzip(zipfile = "coastlines.zip", 
      exdir = 'world_map')

# step 3 - load the data by opening the shape file using readOGR from the sp (spatial) package.
# This step requires also
library(rgdal) # A library for bindings to the 'Geospatial' Data Abstraction Library ('GDAL') and 
# and for accessing the projection operations from the 'PROJ.4' library.
# To allow readOGR function to read an OGR data source and layer into a Spatial data object

world_map <- readOGR("world_map/ne_10m_coastline.shp")
## OGR data source with driver: ESRI Shapefile 

# Map spatial attributes and extent
# For spatial attributes, such as  spatial extent (extremes) of spatial (shape) objects
library(raster) #  has the capability dealing with spatial data/ gridded spatial data
# ranging from reading, writing, manipulating, analyzing and modeling
class(world_map)
extent(world_map)

# Projecion information of the loaded map
crs(coastlines)

# Display the map
plot(coastlines, 
     main = "World Map")

# To limit and simplify the geometry of the map, if needed!
world_map_simp <- gSimplify(world_map, 
                            tol = 3, 
                            topologyPreserve = TRUE)
plot(world_map_simp,
     main = "World map with boundaries simplified")

# The following procedure will use a library that is an Interface Open Source ('GEOS') for topology operations on geometries.
library(rgeos)
# Its function "gSimplify" is used to simplify given geometry using the Douglas-Peuker algorithm
# Simplify is used here with a lower tolerance value, while keeping some more details.
world_map_2 <- gSimplify(world_map, 
                         tol = .1, 
                         topologyPreserve = TRUE)
plot(world_map_2, 
     main = "World Map")

# Convert map data into data frame to use with ggplot
world_map_df <- SpatialLinesDataFrame(world_map_2,
                                      coastlines@data) 
# Dsiplay the map with its title
ggplot() +
  geom_path(data = world_map_df, aes(x = long, y = lat, group = group)) +
  labs(title = "World Map")

###############
# Display the spread dynamics on top of the mpa
# Combining the map data (location) with the virus data (incidence)
###############

spread_w <- ggplot() +
  geom_path(data = world_map_df, aes(x = long, y = lat, group = group, colour ="grey")) + 
  coord_fixed() + 
  labs(title = "Covid-19 Spread",
       subtitle = "Covid-19 worldwide spread from 21 Jan - 31 Mar, 2020 - OperAI",
       x = "Longitude", y = "Latitude") + # coordinates 
  geom_point(data = dataset, aes(x = dataset$x, y = dataset$y,  size= 10*dataset$confirmed_cases, colour ="orange")) +
  theme_bw()

spread_w <- spread_w + transition_time(dataset$day) + labs(title = "Time (Day): {frame_time}")

spread_w

# anim_save("spread_w.gif", spread)


################

# Trace the spread on a map
library(rgdal)
library(raster)
library(sf)


spread <- ggplot() +
  geom_path(data = world_map_df, aes(x = long, y = lat, group = group, colour ="lightgrey")) + 
  coord_fixed() + 
  scale_color_viridis_d() +
  scale_size(range = c(0, 30)) +
  labs(title = "Covid-19 Spread",
       subtitle = "Covid-19 worldwide spread since 21 Jan, 2020 - OperAI",
       x = "Longitude", y = "Latitude") + # coordinates
  geom_point(data = dataset, aes(x = dataset$x, y = dataset$y,  size= dataset$confirmed_cases, colour =dataset$country)) +
  theme_bw()+
  theme(legend.position = "none")

spread <- spread + transition_time(dataset$day) + labs(title = "Time (Day): {frame_time}")

spread 

# anim_save("spread_w.gif", spread)

#######

# To be updated ...
# to explore the dependency, if any, between locations 
# Other variables may also be added to the merged data for more in-depth analysis and prediction. 
# 
