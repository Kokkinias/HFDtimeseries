#Libraries
library(ggplot2)
library(readxl)
library(dplyr)

setwd("/Path/")

#EARLYvsPEAK new DE genes lollipop
earlyvspeak = read_excel("supplementalfig5_6.xlsx",sheet="earlyvspeak")

filtered=prevspeak %>%
  filter(filter=="yes")

ggplot(filtered, aes(x=order, y=log2fc_reverse)) +
  geom_segment( aes(x=order, xend=order, y=0, yend=log2fc_reverse), color="black") +
  geom_point(aes(color=color),size=3)+
  scale_color_manual(values=c('#c51b8a','#fbb4b9'))+
  coord_flip()+
  theme_light()

#PEAKvsLATE new DE genes lollipop
peakvspost = read_excel("supplementalfig5_6.xlsx",sheet="peakvslate")

ggplot(peakvspost, aes(x=order, y=log2fc)) +
  geom_segment( aes(x=order, xend=order, y=0, yend=log2fc), color="black") +
  geom_point(aes(color=color),size=3)+
  scale_color_manual(values=c('#c51b8a','#7a0177'))+
  coord_flip()+
  theme_light()
