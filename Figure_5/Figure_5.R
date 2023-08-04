##Libraries
library(ggplot2)
library(readxl)
library(UpSetR)
library(ComplexUpset)
library(RColorBrewer)

####################################
setwd("/Path/")
#Figure 5A data
data = read_excel("Figure5_data.xlsx", sheet="upset", col_names = TRUE)
df = colnames(data)[6:8]

#Upset plot
all.plot=upset(data,df,sort_sets=FALSE, base_annotations=list('Intersection size'=intersection_size(counts=TRUE)),width_ratio=0.1)
all.plot

#Adding colors
plot=upset(data,df,sort_sets=FALSE, base_annotations=list('Intersection size'=intersection_size(counts=TRUE)),
           annotations = list(
             'category'=(
               ggplot(mapping = aes(fill=category))+
                 geom_bar(stat = 'count', position = 'fill')+
                 scale_fill_manual(values=c("#A6CEE3","#1F78B4","#B2DF8A" ,"#33A02C","#FF7F00","#A59CD3","#939393","#FB9A99","#E31A1C", '#7a0177'))
             )
           ),width_ratio=0.1)
plot

brewer.pal(n = 10, name = "Paired")

#Boxplots
#data for figure 5 B and C
box = read_excel("Figure5_data.xlsx", sheet="boxplots", col_names = TRUE)
colnames(box) <- c ( "sample", "phase","getmm","ID",	"Alt_ID",	"KEGG",	"description",	"category", "gene", "order")

#invA gene boxplot
invA = box %>%
  filter(gene=="invA")

ggplot(invA)+
  geom_boxplot(aes(x=phase,y=getmm),alpha=0.6,fill="NA")+
  geom_point(aes(x=phase,y=getmm,color=phase),size=3, alpha=0.6)+
  scale_color_manual(values=c('#fbb4b9',"#c51b8a","#7a0177"))+
  theme_classic()

#Lactate dehydrogenase lldD gene boxplot
lldD = box %>%
  filter(gene=="lldD")

ggplot(lldD)+
  geom_boxplot(aes(x=phase,y=getmm),alpha=0.6,fill="NA")+
  geom_point(aes(x=phase,y=getmm,color=phase),size=3, alpha=0.6)+
  scale_color_manual(values=c('#fbb4b9',"#c51b8a","#7a0177"))+
  theme_classic()