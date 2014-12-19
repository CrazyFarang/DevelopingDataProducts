Body Mass Index (BMI) is a simple index of weight-for-height that is commonly used to classify underweight, overweight and obesity in adults. It is defined as the weight in kilograms divided by the square of the height in metres (kg/m2).  

### Motivation  

> Key facts:    
Worldwide obesity has nearly doubled since 1980.  
In 2008, more than 1.4 billion adults, 20 and older, were overweight. Of these over 200 million men and nearly 300 million women were obese.  
35% of adults aged 20 and over were overweight in 2008, and 11% were obese.  
65% of the world's population live in countries where overweight and obesity kills more people than underweight.
More than 40 million children under the age of 5 were overweight or obese in 2012.  
Obesity is preventable. [WHO]

### Instructions

The user is required to enter height in centimeters and weight in kilograms.
For measurments in Imperial Units please use following conversions:

> 1 Foot [ft.] = 30.48 Centimeters [cm.] 

> 1 Inch [in.] = 2.54 Centimeters [cm.]

> 1 Pound [lbs.] = 0.4536 Kilograms [kg.]

> 1 Stone [st.] = 6.35 Kilograms [kg.]

Although BMI values are age-independent and same for both sexes for adults, the user needs to select gender, because gender is used as a selection variable in datasets that are used to provide the user some basic information about BMI.  
Next, the user is required to select the country of origin, again in order to get some data summary and plots related to BMI data available for the selected country. If USA is selected as country of origin, the user is also required to select the state.  
In order to get the BMI coefficient, BMI clasiffication, data summary and plots related to the selected gender, country of origin, the user needs to press the **GO** button, so the main panel is populated with the available data.  
The main panel is consist of 5 tabs:  
1. **Your results**, where the user is presented with BMI coefficient calculated according entered weight and height, and classification within the 5 main groups: underweight, normal healthy weight, overweight or obese.  
2. **Data summary**, where the user is presented with the mean BMI and 95% confidence interval for the mean respectively for selected country and gender, and table - the recent BMI indicators available for the selected country. Data used in this section originate from [WHO Global Health Observatory Data Repository](http://apps.who.int/gho/data/node.main.A903?lang=en) and [KNOEMA-WHO Global Database on Body Mass Index](http://knoema.com/WHOGDOBMIMay/who-global-database-on-body-mass-index-bmi) and can be downloaded free. The first dataset comprises data for mean BMI (crude estimate) for both genders per world countries, the second - recent BMI indicators for many countries worldwide. Datasets are pretty clean, with insignificant number of missing values just in the dataset with mean BMI crude estimates. Cleaning of the variables names is done for purpose of easier manipulation and plotting. In case there are no data for the selected country fields are left empty i.e. table is not populated.  
3. **Plot:BMI Indicators** bar plot(rCharts) of most recent BMI indicators for selected country and gender. If there are no data for the specific gender then indicators for adults are plotted. In case there are no data at all the plot is empty. Data originate from KNOEMA-WHO Global Database on Body Mass Index.   
4. **Plot:Mean BMI trend** plot(rCharts) of the trend of mean BMI crude estimates for both genders in time. Data originate from WHO Global Health Observatory Data Repository. If there are no data available for selected country, the plot is not populated.  
5. **Plot:BMI Indicators for US States** If USA of America is selected as country, then respectively the selected state in USA this tab is populated with bar plot(rCharts) of 2012 BMI indicators for adults for selected state. Data used for this section originate from [CDC-Behavioral Risk Factor Surveillance System; Prevalence and Trends Data; Overweight and Obesity-BMI 2012](http://apps.nccd.cdc.gov/brfss/list.asp?cat=OB&yr=2012&qkey=8261&state=All).  
All three datasets are available for free download and were downloaded 10 June,2014.  
Stay healthy and excercize more!  
Feel free to send me your comments,questions or report bugs [crazyfarangm@gmail.com].