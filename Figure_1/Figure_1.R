library(ggplot2)
library(readxl)
library(dplyr)
library(stats)

setwd("/Path/location/")

###Salmonella Relative Abundance between Chow and HFD
data = read_excel("Figure1_data.xlsx", sheet="sal_abun", col_names = TRUE)
data=as.data.frame(data)

ggplot(data, aes(x=sample , y= abun, fill=treatment)) +
  scale_fill_manual(values = c('#67a9cf','#7a0177'))+
  geom_bar(stat= "identity", width =0.75) +
  theme_classic()

####Lipocalin-2 Chow vs HFD
data = read_excel("Figure1_data.xlsx", sheet="lipocalin", col_names = TRUE)

#strip chart/boxplot log
bp<- ggplot(data)+
  geom_boxplot(aes(x=Diet,y=logfc),alpha=0.6,fill="NA")+
  geom_point(aes(x=Diet,y=logfc,color=Diet),alpha=0.6)+
  scale_color_manual(values=c('#67a9cf','#7a0177'))+
  theme_classic()
bp

#STATS
two.way <- aov(logfc~ Diet, data)
summary(two.way)
TukeyHSD(two.way)

########Respiratory Electron Acceptor bar chart
bar = read_excel("Figure1_data.xlsx",sheet="REA_bar")

ggplot(bar, aes(x=genes, y=average, fill=group)) +
  geom_bar(stat="identity", position=position_dodge(), width=.75)+
  scale_fill_manual(values=c('#67a9cf','#7a0177'))+
  coord_flip()+
  theme_light()
