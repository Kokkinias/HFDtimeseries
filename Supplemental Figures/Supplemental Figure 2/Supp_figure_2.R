library(ggplot2)
library(readxl)
library(dplyr)

setwd("path")
#Supplemental figure 2
data = read_excel("Supplemental_figure_2.xlsx",sheet="sal_abun")

HFD = data %>%
  filter(treatment=="HFD")
HFD_sal = HFD %>% 
  filter(day> 0)

#Salmonella abundance Lineplot
ggplot(HFD_sal, aes(x = day, y = abun, colour = sample)) + 
  geom_smooth(se=FALSE,span = 0.7) + geom_point(size=3) + theme_bw() + scale_x_continuous("Day") +
  scale_color_manual(values=c('#808285','#44c1a3',"#f768a1","#f05522","#272d75"))

#2 ASVs Bar chart 
data = read_excel("Supplemental_figure_2_data.xlsx",sheet="bar")
ggplot(data, aes(fill=taxa, y=avg_percent, x=day)) + 
  geom_bar(position="stack", stat="identity")+
  scale_fill_manual(values=c('#b276bf','#67a9cf'))+theme_bw()
