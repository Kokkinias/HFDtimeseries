##Libraries
library(ggplot2)
library(readxl)
library(RColorBrewer)
library(dplyr)

####################################
setwd("/Path/")
#Boxplots
#data
setwd("path")
box = read_excel("Supp_figure4_data.xlsx", sheet="boxplots", col_names = TRUE)
colnames(box) <- c ( "sample", "phase","getmm","ID",	"Alt_ID",	"KEGG",	"description",	"category", "gene", "order")

#invA gene boxplot
invA = box %>%
  filter(gene=="invA")

ggplot(invA)+
  geom_boxplot(aes(x=phase,y=getmm),alpha=0.6,fill="NA")+
  geom_point(aes(x=phase,y=getmm,color=phase),size=3, alpha=0.6)+
  scale_color_manual(values=c('#fbb4b9',"#c51b8a","#7a0177"))+
  theme_classic()

#Lactate dehydrogenase lldD gene boxplot
lldD = box %>%
  filter(gene=="lldD")

ggplot(lldD)+
  geom_boxplot(aes(x=phase,y=getmm),alpha=0.6,fill="NA")+
  geom_point(aes(x=phase,y=getmm,color=phase),size=3, alpha=0.6)+
  scale_color_manual(values=c('#fbb4b9',"#c51b8a","#7a0177"))+
  theme_classic()
