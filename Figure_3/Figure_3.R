##Libraries
library(ggplot2)
library(tidyverse)
library(readxl)
library(pheatmap)

#Data
setwd("path/")

getmm = read_excel("Figure3_data.xlsx", sheet="getmm", col_names = TRUE)

#without day -1/no sal
df2 <-getmm[,14:ncol(getmm)]
df2 = as.data.frame(sapply(df2, as.numeric))

pheatmap(df2, scale= "row",cluster_cols =FALSE, cluster_row = FALSE)
