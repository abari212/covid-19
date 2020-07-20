# Covid-19

Predicting hotspots on near real time to help stop the spread of covid-19. 

-------------------
The codes are also available at https://github.com/abari212/covid-19/blob/master/tracing_modeling_covid_19_spread.R and will be updated along with data.
-------------------

This repository contains both codes and data (UN World Health Organisation data) to help to trace and model the spread of covid-19. Prediction have been found to be another effective measure to curb the spread of covid-19, in addition to physical distancing.  “Slowing the spread of the infection is nearly as important as stopping it”, NY Times (27 March 2020). https://www.nytimes.com/article/flatten-curve-coronavirus.html

Predicting likely hotspots earlier can help to take preventive measures to reduce the number of infections. 
​Predictive models have shown that by acting just a week earlier, 65% of infections would have been avoided. If the same protective measures had been applied three weeks earlier that number would have reached 95% of reduced infections.

The script can be more relevant at a much more granular scale, such as a municipality/city. 
https://www.linkedin.com/posts/abdallah-bari-2a788b14_covid19-patterns-physicaldistancing-activity-6652257884052742144-7_Tv

The UN-WHO data, with the codes, consists of two sets, one on the virus incidence (number of cases) and one on the geo-location information of the area where the incidence occurred. The data on the incidence was extracted from UN-WHO daily reports and the data on the geo-location from Google. Case illustration at https://github.com/abari212/covid-19/blob/master/spread_w.gif

The The UN-WHO data is used to illustrate the codes outcome. 
Any data can be used, such as a city data of covid-19 incidence, can be prepared as two datasets 
The two datasets can be feed to the algorithm as file (a) and file (b), the two file can be merged autmatically.
To make more simple just one set of data can be used or even the app can read data automatically 

A one dataset with the name of the location with the incidence, in the form of: 
•	Date/Time
•	Location or the vicinity name of the incidence, and the
•	Incidence (number of cases). The app can generate new cases, if any, by itself.

Once the two files are uploaded all the rest will be done automatically to generate the spread and eventually the patterns, if any.

Data can be read and prepared automatically, helping thus to read data at any time and at any place. Once read and prepared the predictions can be generated immediately.  
 
Other variables can be added to the merged data for more in-depth analysis and prediction. 
There a number of ways to add other variables and develop predictive model. 
Some of the examples on predictive modeling or prediction are also available at https://github.com/abari212/mca. 
 
--------
Privacy matters!

Tracing and modeling are carried out based on privacy-preserving approaches, without using personal information. Privacy experts in Europe have developed an approach called Decentralized Privacy-Preserving Proximity Tracing (DP-PPT) and their paper on this DP-PPT approach is available at https://lnkd.in/f9etcRp.

The approach that we have been using is also a privacy-preserving based approach, which is based on a "non-contact tracing" approach, to trace and predict the trends. It is a non contact tracing porcedure. As the situation unfolds there are "risks intersecting with the coronavirus crisis that may drive developments in a direction that might undermine individual privacy rights", wrote Natasha Lomas at https://lnkd.in/fy3-MB3. 

Privacy matters in this project.


------------
Some other GitHub data sources at : 

Looker Data Repository - https://github.com/looker/covid19

Johns Hopkins University (JHU/CSSE) COVID-19 datasets - https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data


---------------------------------------------------
More codes are freely also available at https://github.com/abari212/mca, 
related the book on data prepration and modeling at https://www.amazon.com/Working-Big-Data-Scaling-Discovery-ebook/dp/B0786QHJL7/
