# DATA SCIENCE PROJECT (Corona Virus 2020)

# Descriptive Statistcis Overview

This repository contains Python script for variable identification, missing value treatment, outlier identification, outlier 
 treatment, correlation between variables and machine learning modeling. 

## Python Script Descriptive Statistics

1. **'Import pandas as pd'**
   - **Purpose**: To import CVS file into Python Notebook for statistical and predictive analysis.

2. **'Variables'**
   - **Imported Variables**: ID, Case in Country, Unnamed, Summary, Reporting Date, Location, Country, Gender, Age, Symptom Onset, if Onset Approximated, Hospital Visit Date, Exposure Start, Exposure End, Visiting Wuhan, From Wuhan, Death, Recovered, Symptom, Source, Link.
  
   - **Selected Variables**: Case in Country, Reporting Date, Country, Gender, Age, Symptom Onset, Hospital Visit Date, Exposure Start, Exposure End, Visiting Wuahn, From Wuhan, Death, Recovered.

4. **'corona_virus.head()'**
   - **Purpose**: Used to have insight into the dataset.
  
5. **'corona_virus.info()'**
   - **Purpose**: Used to get the concise summary of the corona virus dataset.

6. **'corona_virus.dtypes()'**
   - **Purpose**: Used to check variable types for Int, Float or Object.

7. **'corona_virus.shape'**
   - **Purpose**: Used this script know the number of columns and rows present in the dataset
  
8. **'corona_virus2.rename(columns={'reporting date':'reporting_date'}, inplace=True)'**
   - **Purpose**: Changed column names such as Visiting Wuhan to Visiting_Wuhan, From Wuahn to From_Wuhan etc.
  
9. **'corona_virus2.gender  = corona_virus2.gender.str.replace('female', '0').str.replace('male', '1')'**
   - **Purpose**: Replaced categorical class values to class Binary values as well as using value_counts() to check number number of males and females.
  
10. **'corona_virus2[["reporting_date"]] = corona_virus2[["reporting_date"]].apply(pd.to_datetime)'**
    - **Purpose**: Changed date related columns to Datetime.
   
11. **'corona_virus2.fillna(0, inplace=True)'**
    - **Purpose**: Filling in the null for better result accuracy.
   
 12. **'IQR = Q3 - Q1'**
     - **Purpose**: To identify outliers with interquartile range (IQR).
    
 13. **'Box Plot'**
     - **Purpose**: Another method used to check for outliers, matplotlib inline, importing seaborn as sns and matplotlib.pyplot as plt.
     - **Code**: plt.boxplot = corona_virus3.boxplot(grid=False, rot=45, fontsize=15).
     - plt.show().

![image](https://github.com/user-attachments/assets/275559fd-e7a3-4ee5-bee7-a00f86ea7e67)

  





