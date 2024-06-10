#Libraries
library(ggplot2)
library(readxl)
library(dplyr)
library(vegan)
library(stats)

setwd("Path")


#Metabolite boxplots
data3 = read_excel("FigureS4.xlsx", sheet="boxplot", col_names = TRUE)
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

#STATS
anova <- aov(value~ treatment, car)
summary(anova)
TukeyHSD(anova)

#Lactate
lactate= data3 %>%
  filter(Metabolite=="Lactic acid")

ggplot(lactate)+
  geom_boxplot(aes(x=treatment,y=value),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()
#STATS
anova <- aov(value~ treatment, lactate)
summary(anova)
TukeyHSD(anova)

#Succinate
suc= data3 %>%
  filter(Metabolite=="Succinic acid")

ggplot(suc)+
  geom_boxplot(aes(x=treatment,y=value),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()

#STATS
anova <- aov(value~ treatment, suc)
summary(anova)
TukeyHSD(anova)

#Xylose
xyl= data3 %>%
  filter(Metabolite=="Xylose")

ggplot(xyl)+
  geom_boxplot(aes(x=treatment,y=value),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()
#STATS
anova <- aov(value~ treatment, xyl)
summary(anova)
TukeyHSD(anova)

#Citrate
cit= data3 %>%
  filter(Metabolite=="Citric acid")

ggplot(cit)+
  geom_boxplot(aes(x=treatment,y=value),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()
#STATS
anova <- aov(value~ treatment, cit)
summary(anova)
TukeyHSD(anova)

#Malate
mal= data3 %>%
  filter(Metabolite=="Malic acid")

ggplot(mal)+
  geom_boxplot(aes(x=treatment,y=value),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()
#STATS
anova <- aov(value~ treatment, mal)
summary(anova)
TukeyHSD(anova)

#Fumarate
fum= data3 %>%
  filter(Metabolite=="Fumaric acid")

ggplot(fum)+
  geom_boxplot(aes(x=treatment,y=value),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()
#STATS
anova <- aov(value~ treatment, fum)
summary(anova)
TukeyHSD(anova)

#Aspartate
asp= data3 %>%
  filter(Metabolite=="Aspartic acid")

ggplot(asp)+
  geom_boxplot(aes(x=treatment,y=value),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()
#STATS
anova <- aov(value~ treatment, asp)
summary(anova)
TukeyHSD(anova)

#SCFA boxplots
data2 = read_excel("FigureS4.xlsx.xlsx", sheet="SCFA", col_names = TRUE)
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
#STATS
anova <- aov(value_umol_mg~ treatment, ace)
summary(anova)
TukeyHSD(anova)

#Propionate
pro= data2 %>%
  filter(SCFA=="propionate")

ggplot(pro)+
  geom_boxplot(aes(x=treatment,y=value_umol_mg),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value_umol_mg,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()+ 
  coord_cartesian(ylim = c(0, 1.25))
#STATS
anova <- aov(value_umol_mg~ treatment, pro)
summary(anova)
TukeyHSD(anova)

#Butyrate
but= data2 %>%
  filter(SCFA=="butyrate")

ggplot(but)+
  geom_boxplot(aes(x=treatment,y=value_umol_mg),alpha=0.6,fill="NA")+
  geom_point(aes(x=treatment,y=value_umol_mg,color=treatment),size=3, alpha=0.6)+
  scale_color_manual(values=c('#67a9cf',"#99d8c9","#7a0177"))+
  theme_classic()+ 
  coord_cartesian(ylim = c(0, 1.25))

#STATS
anova <- aov(value_umol_mg~ treatment, but)
summary(anova)
TukeyHSD(anova)
