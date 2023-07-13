library(readxl)
library(ggplot2)
library(vegan)
library(grid)
library(dplyr)
library(DESeq2)
#DESEQ
setwd("/Path/")

####EARLY vs PEAK
cts <- read.table("earlyvspeak.txt",header = TRUE, row.names = "ID")
coldata <- read.table("earlyvspeak_metadata.txt", header=TRUE)

#### PEAK vs LATE
cts <- read.table("peakvslate.txt",header = TRUE, row.names = "ID")
coldata <- read.table("peakvslate_metadata.txt", header=TRUE)

coldata <- coldata[,c("ID","round","cage","mouse","stage", "day")]
coldata$ID <- factor(coldata$ID)
coldata$day <- factor(coldata$day)
coldata$stage <- factor(coldata$stage)
coldata$mouse <- factor(coldata$mouse)

#stage
dds <- DESeqDataSetFromMatrix(countData = cts,
                              colData = coldata,
                              design = ~ stage)

dds
#calculate DESeq results
dds <- DESeq(dds)
res <- results(dds)
res
#Order DESeq results
resOrdered <- res[order(res$padj),]

#graph a volcano plot of DE
drawLines <- function() abline(h=c(-2,2),col="dodgerblue",lwd=2)
plotMA(resOrdered); drawLines()

#write a csv file with the ordered results
write.csv(as.data.frame(resOrdered), 
          file="earlyvspeak_results.csv")
write.csv(as.data.frame(resOrdered), 
          file="peakvspost_results.csv")
