# Covid-19
Tracking to curb the virus spread

This repository contains both codes and data (as a study case) to help to track and eventually help to curb the spread of covid-19, in consultation with people from the domain. 

Tracking is another effective measure to curb the spread of covid-19, in addition to physical distancing. This is a simple animation that I have been working using R, of which a script is available at my GitHub. The same script can be used at a much more granular scale, such as a city. https://lnkd.in/eYBjjx2

The spread output can be layered on top other data-sets to find out what variables are likely to help in the prediction of the spread.

Both scripts and data-sets are shared at GitHub for any one to use to help to stop the spread in consultation with authorities.
https://lnkd.in/eN5BU4m

The data used consists of two sets, one on the virus incidence and one on the geo-location information. The data on the incidence was extracted from WHO daily reports and the data on the location from Google.

To tailor the codes to any area

Data can be prepared as two datasets:

A dataset (file a) with the name loaction and the incidence in the form of: 
  Date,
  Location name, 
  Incidence (number of cases)

A dataset (file b) with geolocation data of the location where the incidence occured (number of cases)
  Location name
  Longitutde
  Latitudde
  
 
The two datasets can be feed to the algorithm as file a and file b
 
Once the two files are uploaded all the rest will be done automatically to generate the sread and eventually the patterns, if any.
 
Other variables can be added to the merged data for more in-depth analysis and prediction.
 
 
 
 




