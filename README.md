# Covid-19
Tracking to curb the virus spread

This repository contains both codes and data (as a study case) to help to track and eventually help to curb the spread of covid-19, in consultation with people from the domain. 

Tracking is another effective measure to curb the spread of covid-19, in addition to physical distancing. This is a simple animation that I have been working using R, of which this script is available. This script can be used at a much more granular scale, such as a mmunicipality/city. https://www.linkedin.com/posts/abdallah-bari-2a788b14_covid19-patterns-physicaldistancing-activity-6652257884052742144-7_Tv

The data used consists of two sets, one on the virus incidence and one on the geo-location information. The data on the incidence was extracted from WHO daily reports and the data on the location from Google.

For the code, data can be prepared as two datasets:

A dataset (file a) with the name of loaction with the incidence, in the form of: 
  Date,
  Location name, 
  Incidence (number of cases)

A dataset (file b) with geolocation data of the location (NOT the person) where the incidence occured (number of cases)
  Location name
  Longitutde
  Latitudde
 
The two datasets can be feed to the algorithm as file a and file b
 
Once the two files are uploaded all the rest will be done automatically to generate the sread and eventually the patterns, if any.
 
Other variables can be added to the merged data for more in-depth analysis and prediction. There a number of ways to add other variables and develop predictive model. Some of the examples prediction are also available at https://github.com/abari212/mca. 
 
 
 
 




