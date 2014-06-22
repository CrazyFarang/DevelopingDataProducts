---
title       : Body Mass Index Classification in Adults
subtitle    : Developing Data Products - Shiny
author      : 
job         : Crazy Farang
framework   : io2012    # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
ext_widgets : {rCharts: [libraries/HighCharts]}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

### Intro & Motivation

Body Mass Index (BMI) is a simple index of weight-for-height that is commonly used to classify underweight, overweight and obesity in adults. It is defined as the weight in kilograms divided by the square of the height in metres (kg/m2).  
Key facts:  
* Worldwide obesity has nearly doubled since 1980.  
* In 2008, more than 1.4 billion adults, 20 and older, were overweight. Of these over 200 million men and nearly 300 million women were obese.  
* 35% of adults aged 20 and over were overweight in 2008, and 11% were obese.  
* 65% of the world's population live in countries where overweight and obesity kills more people than underweight. More than 40 million children under the age of 5 were overweight or obese in 2012.  
* Obesity is preventable.[WHO Obesity and Overweight Factwheet](http://www.who.int/mediacentre/factsheets/fs311/en/)  
Good Nutrition and regular phisical activity are vital for good health and disease prevention. Overweight and obesity are serious and costly health problem worldwide; it's very important people to be informed and aware of overweight and obesity trends.


--- .class #id 

## Shiny App: BMIApp

<div style='text-align: center;'>
    <img src='assets/img/Snap1.jpg' />
</div>   
[BMI Classification in Adults App Hosted by shinyapps.io](https://crazyfarang.shinyapps.io/BMIApp/)  

---

## Features

Enter your weight, height, gender and country of origin and get informed!


<div id = 'chart1' class = 'rChart highcharts'></div>
<script type='text/javascript'>
    (function($){
        $(function () {
            var chart = new Highcharts.Chart({
 "dom": "chart1",
"width":            800,
"height":            400,
"credits": {
 "href": null,
"text": null 
},
"exporting": {
 "enabled": false 
},
"title": {
 "text": null 
},
"yAxis": [
 {
 "title": {
 "text": "MeanBMI" 
} 
} 
],
"series": [
 {
 "data": [
 [
 1980,
            25 
],
[
 1981,
          25.1 
],
[
 1982,
          25.2 
],
[
 1983,
          25.3 
],
[
 1984,
          25.5 
],
[
 1985,
          25.6 
],
[
 1986,
          25.7 
],
[
 1987,
          25.9 
],
[
 1988,
            26 
],
[
 1989,
          26.2 
],
[
 1990,
          26.3 
],
[
 1991,
          26.4 
],
[
 1992,
          26.6 
],
[
 1993,
          26.7 
],
[
 1994,
          26.8 
],
[
 1995,
            27 
],
[
 1996,
          27.1 
],
[
 1997,
          27.2 
],
[
 1998,
          27.4 
],
[
 1999,
          27.5 
],
[
 2000,
          27.6 
],
[
 2001,
          27.8 
],
[
 2002,
          27.9 
],
[
 2003,
            28 
],
[
 2004,
          28.1 
],
[
 2005,
          28.2 
],
[
 2006,
          28.3 
],
[
 2007,
          28.4 
],
[
 2008,
          28.5 
],
[
 2009,
          28.6 
] 
],
"name": "Female",
"type": "line",
"marker": {
 "radius":              3 
} 
},
{
 "data": [
 [
 1980,
          25.4 
],
[
 1981,
          25.5 
],
[
 1982,
          25.6 
],
[
 1983,
          25.7 
],
[
 1984,
          25.8 
],
[
 1985,
            26 
],
[
 1986,
          26.1 
],
[
 1987,
          26.2 
],
[
 1988,
          26.3 
],
[
 1989,
          26.5 
],
[
 1990,
          26.6 
],
[
 1991,
          26.7 
],
[
 1992,
          26.8 
],
[
 1993,
            27 
],
[
 1994,
          27.1 
],
[
 1995,
          27.2 
],
[
 1996,
          27.3 
],
[
 1997,
          27.4 
],
[
 1998,
          27.6 
],
[
 1999,
          27.7 
],
[
 2000,
          27.8 
],
[
 2001,
          27.9 
],
[
 2002,
            28 
],
[
 2003,
          28.1 
],
[
 2004,
          28.2 
],
[
 2005,
          28.3 
],
[
 2006,
          28.4 
],
[
 2007,
          28.5 
],
[
 2008,
          28.6 
],
[
 2009,
          28.6 
] 
],
"name": "Male",
"type": "line",
"marker": {
 "radius":              3 
} 
} 
],
"xAxis": [
 {
 "title": {
 "text": "Year" 
} 
} 
],
"subtitle": {
 "text": null 
},
"id": "chart1",
"chart": {
 "renderTo": "chart1" 
} 
});
        });
    })(jQuery);
</script>

*Plot: Mean body mass index(crude estimate) trend by gender in USA*  
[Github Repository](https://github.com/CrazyFarang/DevelopingDataProducts)

---

## Features

*Plot: BMI indicators in USA - Georgia*  

<div id = 'chart2' class = 'rChart highcharts'></div>
<script type='text/javascript'>
    (function($){
        $(function () {
            var chart = new Highcharts.Chart({
 "dom": "chart2",
"width":            800,
"height":            400,
"credits": {
 "href": null,
"text": null 
},
"exporting": {
 "enabled": false 
},
"title": {
 "text": null 
},
"yAxis": [
 {
 "title": {
 "text": "Value" 
} 
} 
],
"series": [
 {
 "data": [
 [
 "Underweight",
             2 
],
[
 "Normal.Weight",
          33.3 
],
[
 "Overweight",
          35.5 
],
[
 "Obese",
          29.1 
] 
],
"type": "bar",
"marker": {
 "radius":              3 
} 
} 
],
"legend": {
 "enabled": false 
},
"xAxis": [
 {
 "title": {
 "text": "Indicator" 
},
"categories": [ "Underweight", "Normal.Weight", "Overweight", "Obese" ] 
} 
],
"subtitle": {
 "text": null 
},
"id": "chart2",
"chart": {
 "renderTo": "chart2" 
} 
});
        });
    })(jQuery);
</script>

**THINK** POSITIVELY, **EXERCISE** DAILY, **EAT** HEALTHY, **WORK** HARD, **STAY** STRONG, **BUILD** FAITH, **WORRY** LESS, **LOVE** MORE & **BE** HAPPY! :)  
Your comments and questions are welcome. Please report bugs. [crazyfarangm@gmail.com]
