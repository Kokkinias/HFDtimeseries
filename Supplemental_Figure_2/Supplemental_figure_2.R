#Libraries
library(ggplot2)
library(readxl)
library(dplyr)
library(vegan)
library(stats)

setwd("/Path/")


#Metabolite boxplots
data3 = read_excel("Supplemental_figure2_data.xlsx", sheet="metabolites", col_names = TRUE)
colnames(data3) <- c ( "Condition",	"Feature",	"Metabolite",	"Kegg",	"treatment",	"sample",	"value")

#Boxplots
#Carnitine
car= data3 %>%
  filter(Metabolite=="Carnitine")

ggplot(car)+
  geom_boxplot(aes(x=treatment,y=value),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()

#Lactate
lactate= data3 %>%
  filter(Metabolite=="Lactic acid")

ggplot(lactate)+
  geom_boxplot(aes(x=treatment,y=value),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()

#Succinate
suc= data3 %>%
  filter(Metabolite=="Succinic acid")

ggplot(suc)+
  geom_boxplot(aes(x=treatment,y=value),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()

#Xylose
xyl= data3 %>%
  filter(Metabolite=="Xylose")

ggplot(xyl)+
  geom_boxplot(aes(x=treatment,y=value),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()

#Citrate
cit= data3 %>%
  filter(Metabolite=="Citric acid")

ggplot(cit)+
  geom_boxplot(aes(x=treatment,y=value),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()


#Malate
mal= data3 %>%
  filter(Metabolite=="Malic acid")

ggplot(mal)+
  geom_boxplot(aes(x=treatment,y=value),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()

#Fumarate
fum= data3 %>%
  filter(Metabolite=="Fumaric acid")

ggplot(fum)+
  geom_boxplot(aes(x=treatment,y=value),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()
