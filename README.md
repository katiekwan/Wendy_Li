# Wendy-Li-for-Surrogate-campaign-fellowship

I started working as a data science on a local campaign back in January. This repository contains all the EDA and project work that I have done for the campaign. Most of the work is done in R. Please feel free to reach out to me at erinyyu3@gmail.com if you have any questions!

Voter_Registeration_Records_Raw.Rmd - this file illustrates using several R packages to predict race without geocoded information such as longtitude and latitude. zipWRUext2 package takes zipcode and last name as inputs to make the prediction.

Voter_Registeration_Records_Geocoded.Rmd - this file illustrates how to use the wru package to predict race. To make block level predictions, you would need the block and tract number for each of the address in the voter registration file but the geocoded file only has longtitude and latitude fields. You also need the block level Census data as well. 

Below are the steps that I took to get the block and tract number.
1) I used the 'tigris' package to download a Census block shapefile into R
2) I converted my data frame into a sf object using the st_as_sf function from 'sf' package. The 'sf' package is used for working with spatial data, particularly for reading, writing, and manipulating spatial data objects.
3) I used the function st_join from the 'sf' package to find the block and tract number for each address in my data frame
4) I used the function get_census_data from the 'wru' package to download the 2010 Census data for NY state. Please make sure you download the data from year 2010 because I don't think 2020 data is currently being supported in the wru package. Now you should have all you need to use the predict_race function from the 'wru' package to predict race.

Voting_History.Rmd - this file was created to clean the data from the voting history records. 
