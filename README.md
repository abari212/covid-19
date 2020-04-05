# Covid-19

Tracking and modeling to help curb the covid-19 virus spread.

This repository contains both codes and data (as a study case) to track and model the spread of covid-19, and help to curb its spread in consultation with people from the health domain. 

Tracking is another effective measure to curb the spread of covid-19, in addition to physical distancing. 
This script can be used at a much more granular scale, such as a municipality/city. 
https://www.linkedin.com/posts/abdallah-bari-2a788b14_covid19-patterns-physicaldistancing-activity-6652257884052742144-7_Tv

The data used consists of two sets, one on the virus incidence (number of cases) and one on the geo-location information of the area  where the incidence occured. 
In this study case the data on the incidence was extracted from UN World Health Organisation (WHO) daily reports and the data on the geo-location from Google. Case illustration at https://github.com/abari212/covid-19/blob/master/spread_w.gif

For the code, data can be prepared as two datasets:

A dataset (file a) with the name of the loaction with the incidence, in the form of: 
  Date,
  Location name, 
  Incidence (number of cases).

A dataset (file b) with geolocation data of the location (NOT the person) where the incidence occured (number of cases):
  Location name,
  Longitutde,
  Latitudde.
 
The two datasets can be feed to the algorithm as file a and file b.
 
Once the two files are uploaded all the rest will be done automatically to generate the spread and eventually the patterns, if any.
 
Other variables can be added to the merged data for more in-depth analysis and prediction. 
There a number of ways to add other variables and develop predictive model. 
Some of the examples prediction are also available at https://github.com/abari212/mca. 
 
Data can also be feed as stream data to help with near-real time prediction and prevention.


Detecting patterns in the data

The overall approach is based on the assumption that nearby georeferenced locations (such a county name), with covid-19 cases, are associated in some way as a result of their proximity in space and time. It is likely that the data are linked some how either in space or time or both. 

One the metrics used to measure the extent of this association or dependency, bewteen these incidences, is the variogram. It is used as a way to detect on how spatial data are related as a prerequisite for prediction in comobination with kriging method. The later is used, in turn, as an interpolation procedure based on the degree of this dependency. By analogy the process can be considered as that of a Bayesian approach defining a prior distribution function that is used to generate the a posteriori predictions. Kriging is also known as a spatial prediction methodology in the context of spatio-temporal data. 

To create maps R module applied to irregularly spaced data where the correlation between geographical locations is understood to be an exponential function of the distance, was used. R is becoming a de facto platform to develop and share mathematical scripts as well as data including spatio-temporal data. 

The code is at https://github.com/abari212/covid-19/blob/master/covid-19%20tracking.R and will be updated along with data.
 




