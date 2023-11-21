#Libraries
library(readxl)
library(ggplot2)
library(vegan)
library(dplyr)
library(stats)
library(ggbreak) 

####################################
setwd("Path/")
##################################################
##Figure 5A Volcano plot and donut plot
##################################################
#Volcano plots EARLY vs PEAK
#volcano plot data
counts = read_excel("Figure5_data.xlsx",sheet="earlyvspeak")
#temporarily removed point and readd to the plot
counts2 = counts %>%
  filter(ID!="5083_1")

ggplot(counts2, aes(x=opposite_logfold, y=baseMean)) +
  geom_point(aes(x=opposite_logfold, y=baseMean,color=category),size=3)+
  scale_color_manual(values=c("#E2E1E0","#E2E1E0","#939393",'#4B2D9F','#A59CD3',"#000000",'#EE51B1',"#E3C515"))+
  theme_classic()+scale_x_break(c(-7, -11.7))

#Donut plot early vs peak
df = read_excel("Figure5_data.xlsx",sheet="donut_earlyvspeak")

ggplot(df, aes(x = phase, y = percentage, fill = category)) +
  geom_col() +
  scale_x_discrete(limits = c(" ", "early","peak"))+
  scale_fill_manual(values=c('#4B2D9F',"#000000",'#A59CD3',"#939393",'#EE51B1',"#E3C515"))+
  coord_polar("y") +
  theme_void()

##################################################
##Figure 5B Volcano plot and donut plot
##################################################
#volcano plot data
#PEAK vs LATE
counts = read_excel("Figure5_data.xlsx",sheet="peakvslate")

#volcano plot
ggplot(counts, aes(x=log2FoldChange, y=baseMean)) +
  geom_point(aes(x=log2FoldChange, y=baseMean,color=category),size=3)+
  scale_color_manual(values=c("#E2E1E0","#E2E1E0","#939393",'#A59CD3',"#000000",'#EE51B1',"#E3C515"))+
  theme_classic()+scale_y_break(c(4090, 312000))

#donut plot data
df2 = read_excel("Figure5_data.xlsx",sheet="donut_peakvspost")

ggplot(df2, aes(x = phase, y = percentage, fill = category)) +
  geom_col() +
  scale_x_discrete(limits = c(" ", "peak","late"))+
  scale_fill_manual(values=c("#000000",'#A59CD3',"#939393",'#EE51B1',"#E3C515"))+
  coord_polar("y") +
  theme_void()
