#Libraries
library(readxl)
library(ggplot2)
library(vegan)
library(dplyr)
library(stats)
library(pheatmap)
library(RColorBrewer)

####################################
setwd("Path/")
##################################################
##Figure 4A NMDS carbon substrate utilization
##################################################
#features as columns, samples as rows
features = read_excel("Figure4_data.xlsx", sheet="NMDS", col_names = TRUE)
colnames(features) <- c ( "ID", "mouse", "phase", "day")

#make a metadata frame
df <- features [,5:ncol(features)]
df = as.data.frame(sapply(df, as.numeric))

########
##NMDS for untransformed
########
#Untransformed 
set.seed(3)
bray_dist = metaMDSdist(df, distance = "bray", 
                        autotransform = FALSE, noshare = 0.2, trace = 1)

NMDS_Bray <-metaMDS(df, distance = "bray",
                    autotransform = FALSE, maxit=800, noshare = 0.2, trace = 1)
#Untransformed stress=0.08

data.scrs = as.data.frame(scores(NMDS_Bray, display="sites"))

#add columns to data frame 
data.scrs$phase = features$phase
data.scrs$mouse = features$mouse
data.scrs$ID = features$ID
data.scrs$day = features$day
data.scrs$day <- as.factor(data.scrs$day)

#NMDS plot
plot_getmm = ggplot(data.scrs, aes(x=NMDS1, y=NMDS2)) +
  scale_color_manual(values=c('#fbb4b9','#7a0177','#c51b8a'))+
  geom_point(size= 3, aes(color=phase))+
  theme_classic()

plot_getmm

##########Grouping by Phase SIGNIFICANT
##anosim and mrpp
anosim <- anosim(bray_dist, features$phase, permutations = 999)
anosim
#ANOSIM statistic R: 0.4363 
#Significance: 0.002 

mrpp_data = mrpp(bray_dist, features$phase)
mrpp_data

#Chance corrected within-group agreement A: 0.1493 
#Based on observed delta 0.4983 and expected delta 0.5857
#Significance of delta: 0.001

##########Grouping by Mouse NOT SIGNIFICANT
##anosim and mrpp
anosim <- anosim(bray_dist, features$mouse, permutations = 999)
anosim
#ANOSIM statistic R: -0.1658 
#Significance: 0.996 

mrpp_data = mrpp(bray_dist, features$mouse)
mrpp_data

#Chance corrected within-group agreement A: -0.05787 
#Based on observed delta 0.6196 and expected delta 0.5857 
#Significance of delta: 0.997

##################################################
##Figure 4B carbon heatmap
##################################################
getmm = read_excel("carbon_heatmap_data_082123.xlsx", sheet="mean_getmm_relabun", col_names = TRUE)

filtered <- getmm %>%
  filter(filter=="yes")
df <-getmm[,10:ncol(getmm)]
df<- filtered[,10:ncol(filtered)]
df = as.data.frame(sapply(df, as.numeric))

pheatmap(df, scale= "row",cluster_cols =FALSE, cluster_row = FALSE,colorRampPalette(brewer.pal(9,"Reds"))(100))
