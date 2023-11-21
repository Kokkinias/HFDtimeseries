##Libraries
library(ggplot2)
library(tidyverse)
library(readxl)
library(pheatmap)
library(RColorBrewer)

#Data
setwd("/Users/katherinekokkinias/Desktop/Research/Microbiome/Salmonella/Figures/SalmonellaPaper/R_code_Salmonellapaper/github/Figure3/")

getmm = read_excel("Figure3_data.xlsx", sheet="getmm", col_names = TRUE)
getmm = read_excel("Figure3_data.xlsx", sheet="getmmlog1", col_names = TRUE)
getmm = read_excel("Figure3_data.xlsx", sheet="getmm_relabun", col_names = TRUE)
getmm = read_excel("Figure3_data.xlsx", sheet="mean_getmm_relabun", col_names = TRUE)

#without day -1/no sal
df2 <-getmm[,10:ncol(getmm)]
df2 <-getmm[,14:ncol(getmm)]
df2 = as.data.frame(sapply(df2, as.numeric))

pheatmap(df2, scale= "row",cluster_cols =FALSE, cluster_row = FALSE,colorRampPalette(brewer.pal(9,"Reds"))(100))

#STATS
stats = read_excel("Figure3_data.xlsx", sheet="stats", col_names = TRUE)
one.way <- aov(value~ phase, stats)
summary(one.way)
TukeyHSD(one.way)
