#Libraries
library(ggplot2)
library(readxl)
library(dplyr)
library(vegan)
library(stats)

setwd("path")


#Metabolite boxplots
data3 = read_excel("Supplemental_figure3_data.xlsx", sheet="boxplot", col_names = TRUE)
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

#Aspartate
asp= data3 %>%
  filter(Metabolite=="Aspartic acid")

ggplot(asp)+
  geom_boxplot(aes(x=treatment,y=value),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()

#SCFA boxplots
data2 = read_excel("Supplemental_figure3_data.xlsx", sheet="SCFA", col_names = TRUE)
colnames(data2) <- c ( "SCFA",	"treatment",	"sample",	"value_umol_mg")

#Boxplots
#Acetate
ace= data2 %>%
  filter(SCFA=="acetate")

ggplot(ace)+
  geom_boxplot(aes(x=treatment,y=value_umol_mg),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value_umol_mg,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()+ 
  coord_cartesian(ylim = c(0, 1.25))

#Propionate
pro= data2 %>%
  filter(SCFA=="propionate")

ggplot(pro)+
  geom_boxplot(aes(x=treatment,y=value_umol_mg),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value_umol_mg,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()+ 
  coord_cartesian(ylim = c(0, 1.25))

#Butyrate
but= data2 %>%
  filter(SCFA=="butyrate")

ggplot(but)+
  geom_boxplot(aes(x=treatment,y=value_umol_mg),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value_umol_mg,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()+ 
  coord_cartesian(ylim = c(0, 1.25))
