library(ggplot2)
library(readxl)
library(dplyr)

setwd("path/")
#figure 2B
data = read_excel("Figure2_data.xlsx",sheet="sal_abun")

HFD = data %>%
  filter(treatment=="HFD")
HFD_sal = HFD %>% 
  filter(day> 0)

#Salmonella abundance Lineplot
ggplot(HFD_sal, aes(x = day, y = abun, colour = sample)) + 
  geom_smooth(se=FALSE,span = 0.7) + geom_point(size=3) + theme_bw() + scale_x_continuous("Day") +
  scale_color_manual(values=c('#808285','#fbb4b9',"#f768a1","#c51b8a","#7a0177"))

#2 ASVs Bar chart 
data = read_excel("Figure2_data.xlsx",sheet="bar")
ggplot(data, aes(fill=taxa, y=avg_percent, x=day)) + 
  geom_bar(position="stack", stat="identity")+
  scale_fill_manual(values=c('#99d8c9','#67a9cf'))+theme_bw()

#S3 expression lineplot
data = read_excel("Figure2_data.xlsx",sheet="s3")

HFD = data %>%
  filter(treatment=="HFD")
HFD_sal = HFD %>% 
  filter(day> 0)

#S3 lineplot 
ggplot(HFD_sal, aes(x = day, y = s3, colour = sample)) + 
  geom_smooth(se=FALSE,span = 0.9) + geom_point(size=3) + theme_bw() + scale_x_continuous("Day") +
  scale_color_manual(values=c('#808285','#fbb4b9',"#f768a1","#c51b8a","#7a0177"))

