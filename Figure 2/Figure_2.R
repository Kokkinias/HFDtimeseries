library(ggplot2)
library(readxl)
library(dplyr)

setwd("/Users/katherinekokkinias/Desktop/Research/Microbiome/Salmonella/Figures/SalmonellaPaper/R_code_Salmonellapaper/github/Figure2/")
#figure 2B
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
