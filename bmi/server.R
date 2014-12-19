BMI<-function(wght,hght) {
        if (wght==0 | hght==0) return(NA) 
                else  return(round(wght/(hght/100)^2,1))
}
classBMI<-function(bmic) {
        if (is.na(bmic)) return ("")
        else {
                if (bmic<18.5) return("Your BMI is less than 18.5 you are considered UNDERWEIGHT") 
                if (bmic>=8.5 & bmic<24.9) return("Your BMI is in range 18.5 to 24.9 you are in HEALTHY WEIGHT RANGE")
                if (bmic>=25 & bmic<29.9) return("Your BMI is in range 25 to 29.9 you are OVERWEIGHT")
                if (bmic>=30) return("Your BMI is higher than 30 you are OBESE")
        }
}
country<-function(ccode,state){
        if (ccode=="USA") return (paste ("United States of America - ",state,sep=""))
        else return(ISO_3166_1[ISO_3166_1$Alpha_3==ccode,4])
}
BMICrd<-function(ccode,gender){
        temp<-subset(BMICrude,BMICrude$countrycode==ccode & BMICrude$sexdisplay==gender & BMICrude$displayvalue!="?")
        if (nrow(temp)==0) return ("There are no data available for for your country")
        else {
                temp<-temp[order(-as.numeric(temp$yearcode)),]
                return(paste(temp[1,"displayvalue"], ";",temp[1,"yearcode"]," Data",sep="" ))
        }
}
BMICategories<-function(ccode){
        temp<-subset(BMICat,BMICat$Code==ccode)
        temp<-temp[order(temp$Year,decreasing=TRUE),c("Year","Indicator","Value")]
        #temp<-subset(temp,temp$year==max(temp$year),select=c(2,5))
        return(temp)
}
BMICatPlot<-function(ccode,gender,state){
            temp<-subset(BMICat,BMICat$Code==ccode & grepl(paste("^BMI ",tolower(gender),"s",sep=""),as.character(BMICat$Indicator)))
            if (nrow(temp)!=0) {
                    temp<-temp[order(temp$Year,decreasing=TRUE),]
                    temp<-temp[temp$Year==max(temp$Year),c(2,5,7)]}
            if (nrow(temp)==0) {
                    temp<-subset(BMICat,BMICat$Code==ccode & grepl(paste("^BMI adults",sep=""),as.character(BMICat$Indicator)))    
                    if (nrow(temp)!=0) {
                            temp<-temp[order(temp$Year,decreasing=TRUE),]
                            temp<-temp[temp$Year==max(temp$Year),c(2,5,7)]}
            }
            return(temp)
}
BMICatPlotYear<-function(ccode,gender,state){
        temp<-subset(BMICat,BMICat$Code==ccode & grepl(paste("^BMI ",tolower(gender),"s",sep=""),as.character(BMICat$Indicator)))
        if (nrow(temp)!=0) {
                temp<-temp[order(temp$Year,decreasing=TRUE),]
                temp<-temp[temp$Year==max(temp$Year),c(2,5,7)]
                return(paste(unique(temp$Year),"Data"))}
        if (nrow(temp)==0) {
                temp<-subset(BMICat,BMICat$Code==ccode & grepl(paste("^BMI adults",sep=""),as.character(BMICat$Indicator)))    
                if (nrow(temp)==0) return("No Data!")
                if (nrow(temp)!=0) {
                        temp<-temp[order(temp$Year,decreasing=TRUE),]
                        temp<-temp[temp$Year==max(temp$Year),c(2,5,7)]
                        return(paste(unique(temp$Year),"Data"))}
        }
        return(temp)
}
BMITrend<-function(ccode){
        temp<-subset(BMICrude,BMICrude$countrycode==ccode,select=c("yearcode","numeric","sexdisplay"))
        #if (nrow(temp)!=0) {
        temp<-temp[order(c(temp$yearcode,temp$gender)),]
        names(temp)<-c("Year","MeanBMI","Gender")
        #}
        return(temp)
}
USStatesPlot<-function(ccode,state){
        if (ccode=="USA") temp<-subset(USStatesData,USStatesData$State==state)
        else temp<-subset(USStatesData,USStatesData$State=="XXX")
        return(temp)                
}
USStatesLabel<-function(ccode,state){
        if (ccode=="USA") return(state)
        else return("")                
}
library(shiny)
library(reshape2)
library(xlsx)
library(ISOcodes)
library(rCharts)
data(ISO_3166_1)
USState<-read.xlsx("data/USStates.xlsx",header=TRUE,sheetIndex=1)
USStatesData<-melt(USState,id.vars="State")
names(USStatesData)<-c("State","Indicator","Value")
BMICrude<-read.csv("data/dataverbose.csv")
BMICat<-read.csv("data/ObservationDataiijxxz.csv")
BMICat$Year<-as.numeric(format(as.Date(as.character(BMICat$Date),format="%d/%m/%Y"),"%Y"))
shinyServer(
        function(input, output) {
                
                output$oiweight <- renderPrint({input$weightM})
                output$oiheight <- renderPrint({input$heightM})
                output$oiBMI <- renderPrint({
                        input$goButton
                        isolate(BMI(input$weightM,input$heightM))
                        })
                output$oiBMIclass<-renderText({
                        input$goButton
                        isolate(classBMI(BMI(input$weightM,input$heightM)))
                        })
                output$oicountry<-renderText({
                        input$goButton
                        isolate(country(input$country,input$state))
                        })
                output$oigender <- renderText({
                        input$goButton
                        isolate(input$gender)
                        })
                output$oiBMIcrude <- renderText({
                        input$goButton
                        isolate(BMICrd(input$country,input$gender))
                        })
                output$oiBMIcattable = renderDataTable({
                        input$goButton
                        isolate(BMICategories(input$country))
                        })
                output$oiPlotYear = renderText({
                        input$goButton
                        isolate(BMICatPlotYear(input$country,input$gender,input$state))
                })
                output$Plot1 <- renderChart({
                        input$goButton
                        isolate(datap<-BMICatPlot(input$country,input$gender,input$state))
                        hb1 = hPlot(x = "Indicator", y = "Value", data = datap, type = "bar")
                        hb1$addParams(dom ='Plot1')
                        return(hb1)
                })
                output$Plot2 <- renderChart({
                        input$goButton
                        isolate(datat<-BMITrend(input$country))
                        hp1 <- hPlot(x = "Year", y = "MeanBMI",group="Gender", data = datat, type = "line")
                        hp1$addParams(dom ='Plot2')
                        return(hp1)
                })
                output$oiState<-renderText({
                        input$goButton
                        isolate(USStatesLabel(input$country,input$state))
                })
                output$Plot3 <- renderChart({
                        input$goButton
                        isolate(datau<-USStatesPlot(input$country,input$state))
                        hb2 = hPlot(x = "Indicator", y = "Value", data = datau, type = "bar")
                        hb2$addParams(dom ='Plot3')
                        return(hb2)
                })
})                