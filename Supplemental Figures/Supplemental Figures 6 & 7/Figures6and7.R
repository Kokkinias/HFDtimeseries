#Libraries
library(ggplot2)
library(readxl)
library(dplyr)

setwd("Path")

#EARLYvsPEAK new DE genes lollipop
earlyvspeak = read_excel("Figures6and7.xlsx",sheet="earlyvspeak")

ggplot(earlyvspeak, aes(x=order, y=log2fc_ordered)) +
  geom_segment( aes(x=order, xend=order, y=0, yend=log2fc_ordered), color="black") +
  geom_point(aes(color=color),size=3)+
  scale_color_manual(values=c('#fbb4b9','#c51b8a'))+
  coord_flip()+
  theme_light()

#PEAKvsLATE new DE genes lollipop
peakvslate = read_excel("Figures6and7.xlsx",sheet="peakvslate")

ggplot(peakvslate, aes(x=order, y=log2fc_ordered)) +
  geom_segment( aes(x=order, xend=order, y=0, yend=log2fc_ordered), color="black") +
  geom_point(aes(color=color),size=3)+
  scale_color_manual(values=c('#c51b8a','#7a0177'))+
  coord_flip()+
  theme_light()
