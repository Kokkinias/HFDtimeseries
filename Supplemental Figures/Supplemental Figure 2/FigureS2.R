library(readxl)
library(ggplot2)
library(vegan)
library(dplyr)
library(stats)
library(ggbreak) 

setwd("Path")

#Salmonella relative abundance lineplots
#df
df = read_excel("Figure_S2.xlsx", sheet="rel_abun", col_names = TRUE)
df=as.data.frame(df)
colnames(df) <- c("ASV","treatment","sample","day","rel_abun")

#Filter
HFD_M1 <- df %>% filter(sample == "5_11_1")

#line plot
ggplot(HFD_M1, aes(x=day , y= rel_abun,group=ASV, color=ASV)) +
  geom_line(size=1) +
  geom_point(size=3)+
  scale_color_manual(values=c('#7a0177')) +theme_bw() +
  theme_classic()

#Filter
HFD_M2 <- df %>% filter(sample == "5_12_2")
#line plot
ggplot(HFD_M2, aes(x=day , y= rel_abun,group=ASV, color=ASV)) +
  geom_line(size=1) +
  geom_point(size=3)+
  scale_color_manual(values=c('#7a0177')) +theme_bw() +
  theme_classic()

#Filter
HFD_M3 <- df %>% filter(sample == "5_13_5")
#line plot
ggplot(HFD_M3, aes(x=day , y= rel_abun,group=ASV, color=ASV)) +
  geom_line(size=1) +
  geom_point(size=3)+
  scale_color_manual(values=c('#7a0177')) +theme_bw() +
  theme_classic()

#Filter
HFD_M4 <- df %>% filter(sample == "5_14_1")
#line plot
ggplot(HFD_M4, aes(x=day , y= rel_abun,group=ASV, color=ASV)) +
  geom_line(size=1) +
  geom_point(size=3)+
  scale_color_manual(values=c('#7a0177')) +theme_bw() +
  theme_classic()

#Filter
HFD_M5 <- df %>% filter(sample == "5_14_5")
#line plot
ggplot(HFD_M5, aes(x=day , y= rel_abun,group=ASV, color=ASV)) +
  geom_line(size=1) +
  geom_point(size=3)+
  scale_color_manual(values=c('#7a0177')) +theme_bw() +
  theme_classic()

#Filter
Chow_M1 <- df %>% filter(sample == "3_X_13")
#line plot
ggplot(Chow_M1, aes(x=day , y= rel_abun,group=ASV, color=ASV)) +
  geom_line(size=1) +
  geom_point(size=3)+
  scale_color_manual(values=c('#67a9cf')) +theme_bw() +
  theme_classic()

#Filter
Chow_M2 <- df %>% filter(sample == "3_X_15")
#line plot
ggplot(Chow_M2, aes(x=day , y= rel_abun,group=ASV, color=ASV)) +
  geom_line(size=1) +
  geom_point(size=3)+
  scale_color_manual(values=c('#67a9cf')) +theme_bw() +
  theme_classic()

#Filter
Chow_M3 <- df %>% filter(sample == "3_X_16")
#line plot
ggplot(Chow_M3, aes(x=day , y= rel_abun,group=ASV, color=ASV)) +
  geom_line(size=1) +
  geom_point(size=3)+
  scale_color_manual(values=c('#67a9cf')) +theme_bw() +
  theme_classic()

#Filter
Chow_M4 <- df %>% filter(sample == "3_X_28")
#line plot
ggplot(Chow_M4, aes(x=day , y= rel_abun,group=ASV, color=ASV)) +
  geom_line(size=1) +
  geom_point(size=3)+
  scale_color_manual(values=c('#67a9cf')) +theme_bw() +
  theme_classic()
