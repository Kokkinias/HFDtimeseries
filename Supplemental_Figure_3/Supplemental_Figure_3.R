#Libraries
library(readxl)
library(dplyr)
library(pheatmap)

#Supplemental Figure 3 Heatmap
setwd("/Path/")

#Carbon heatmap data
data = read_excel("Supplemental_Figure_3.xlsx", sheet="carbon", col_names = TRUE)
df <-data[,9:ncol(data)]
df = as.data.frame(sapply(df, as.numeric))

#to remove day -1 
nosalremoved <- data[ , -which(names(data) %in% c("5_11_1_-1","5_12_2_-1","5_13_5_-1","5_14_1_-1", "5_14_5_-1"))]
df <-nosalremoved[,9:ncol(nosalremoved)]

df = as.data.frame(sapply(df, as.numeric))
#Add annotations
DRAM = data.frame("DRAM" = data$DRAM_header)
rownames(df) <- rownames(DRAM)

#Heatmap generation
pheatmap(df, scale= "row",cluster_cols =FALSE, cluster_row = FALSE, annotation_row = DRAM)
