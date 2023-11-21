library(ggplot2)
library(dplyr)
library(readxl)
library(stats)


setwd("/Path/location/")

#DIVERSITY
data2 = read_excel("Supp_Figure1.xlsx", sheet="Supp_Figure1", col_names = TRUE)
data2 <- data2 %>%
  filter(diet_day=="HFD_D"|diet_day=="Chow_D"|diet_day=="HFD_day8"|diet_day=="Chow_day11")

#richness
ggplot(data2)+
  geom_boxplot(aes(x=diet_day,y=richness),alpha=0.6,fill="NA")+
  geom_point(aes(x=diet_day,y=richness,color=diet),alpha=0.6, size=3)+
  scale_color_manual(values=c('#67a9cf','#7a0177'))+
  theme_classic()
#STATS
two.way.rich <- aov(richness~ diet_day, data2)
summary(two.way.rich)
TukeyHSD(two.way.rich)

#shannon
ggplot(data2)+
  geom_boxplot(aes(x=diet_day,y=shannon),alpha=0.6,fill="NA")+
  geom_point(aes(x=diet_day,y=shannon,color=diet),alpha=0.6, size=3)+
  scale_color_manual(values=c('#67a9cf','#7a0177'))+
  theme_classic()
#STATS
two.way.shan <- aov(shannon~ diet_day, data2)
summary(two.way.shan)
TukeyHSD(two.way.shan)
