# Covid-19

Tracing and modeling to help curb the covid-19 virus spread. Modeling can help to avoid surges, ahead of time.

-------------------
The codes are at https://github.com/abari212/covid-19/blob/master/tracing_modeling_covid_19_spread.R and will be updated along with data.
-------------------

This repository contains both codes and data (UN World Health Organisation data) to help to trace and model the spread of covid-19. Tracing has been found to be an effective measure to curb the spread of covid-19, in addition to physical distancing.  “Slowing the spread of the infection is nearly as important as stopping it”, NY Times (27 March 2020). https://www.nytimes.com/article/flatten-curve-coronavirus.html

The script can be more relevant at a much more granular scale, such as a municipality/city. 
https://www.linkedin.com/posts/abdallah-bari-2a788b14_covid19-patterns-physicaldistancing-activity-6652257884052742144-7_Tv

The UN-WHO data used here consists of two sets, one on the virus incidence (number of cases) and one on the geo-location information of the area where the incidence occurred. The data on the incidence was extracted from UN-WHO daily reports and the data on the geo-location from Google. Case illustration at https://github.com/abari212/covid-19/blob/master/spread_w.gif

For the code, other data, such as a city data of covid-19 incidence, can be prepared as two datasets:

A dataset (file a) with the name of the location with the incidence, in the form of: 
•	Date,
•	Location name, 
•	Incidence (number of cases).

A dataset (file b) with geolocation data of the location (NOT the person) where the incidence occurred (number of cases):
•	  Location name,
•	  Longitude,
•	  Latitude.
 
The two datasets can be feed to the algorithm as file (a) and file (b).
 
Once the two files are uploaded all the rest will be done automatically to generate the spread and eventually the patterns, if any.
 
Other variables can be added to the merged data for more in-depth analysis and prediction. 
There a number of ways to add other variables and develop predictive model. 
Some of the examples on predictive modeling or prediction are also available at https://github.com/abari212/mca. 
 
Detecting patterns/ Predictive modeling

The overall approach of prediction is based on the assumption that nearby georeferenced locations (such a county name), with covid-19 incidence/cases, are associated in some way to each other, as a result of their proximity in space and time. To create maps R module applied to irregularly spaced data where the correlation between geographical locations is understood to be an exponential function of the distance, was used. R is becoming a de facto platform to develop and share mathematical scripts as well as data including spatio-temporal data. 

The code is at https://github.com/abari212/covid-19/blob/master/tracing_modeling_covid_19_spread.R and will be updated along with data.

Privacy matters!

Tracing and modeling are carried out based on privacy-preserving approaches, without using any personal information. Privacy experts in Europe have developed an approach called Decentralized Privacy-Preserving Proximity Tracing (DP-PPT) for that matter. Paper on DP-PPT approach is available at https://lnkd.in/f9etcRp.

The approach that we have been using is also a privacy-preserving based approach to trace and predict the trends. As the situation unfolds, the "risks intersecting with the coronavirus crisis may drive developments in a direction that undermine individual privacy rights", wrote Natasha Lomas. https://lnkd.in/fy3-MB3
Privacy also matters in this project.


------------
some othe github data sources : https://github.com/looker/covid19


---------------------------------------------------
More codes are freely also available at https://github.com/abari212/mca, 
related the book on data prepration and modeling at https://www.amazon.com/Working-Big-Data-Scaling-Discovery-ebook/dp/B0786QHJL7/
