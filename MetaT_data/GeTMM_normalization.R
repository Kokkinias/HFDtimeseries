library(readxl)
library(dplyr)
library(tidyr)
library(edgeR)

################
## in this, i will filter out genes with no hits and then use the filtered data to calculate geTMM values
################

setwd("/Path/")

#########
## step 1: merge prodigal split genes (summing their counts) and output a clean wide table
#########

# read in htseq-count output: table with genes as rows and samples as columns, fragments as counts
counts = read_excel("htseq_sal_gene_counts_rev.xlsx",sheet="duplicates_combined")
counts=as.data.frame(counts)
colnames(counts) <- c("Renamed_ID","ID","3_X_13_11","3_X_15_11",	"3_X_16_11",
                      "3_X_28_11","3_X_32_11",	"3_X_45_11",	"3_X_46_11",	"3_X_47_11",
                      "3_X_49_11",	"3_X_50_11",	"5_11_1_-1",	"5_11_1_1",	"5_11_1_3",
                      "5_11_1_5",	"5_11_1_8",	"5_12_2_-1",	"5_12_2_1","5_12_2_3","5_12_2_5",
                      "5_12_2_8","5_13_5_-1","5_13_5_1","5_13_5_3","5_13_5_5","5_13_5_8",
                      "5_14_1_-1","5_14_1_1","5_14_1_3","5_14_1_5","5_14_1_8","5_14_5_-1",
                      "5_14_5_1","5_14_5_3","5_14_5_5","5_14_5_8")
# get rid of genes with all 0 counts
counts$sum=rowSums(counts[,3:37])
counts_filtered = counts %>%
  filter(sum>0) # removed 33 genes
# combined prodigal split and ambigous already

data= counts_filtered[,2:38]

#########
## step 2: calculate geTMM
#########

# read in gene lengths
lengths=read.delim("Salmonella_gene_length.txt",sep="\t",header=FALSE)
colnames(lengths)=c("gene","length")

# add lengths to wide table
data_length=inner_join(data,lengths,by=c("ID"="gene"))
sum(is.na(data_length$length)) #check for NA, should be 0
data_length=as.data.frame(data_length)
row.names(data_length)=data_length[,1]
data_length=data_length[,-1]

# calculate rpk by dividing counts by gene length
rpk = ((data_length[,1:35]*10^3)/data_length$length)
row.names(rpk)=row.names(data_length)
group <- c(rep("A",ncol(rpk)))
rpk.norm <- DGEList(counts=rpk,group=group)

# read in lib size - here i am using trimmed library size
lib_size = read.delim("library_size.txt",header = TRUE)
lib_size=as.data.frame(lib_size)
row.names(lib_size) = lib_size$sample
rpk.norm$samples$lib.size = lib_size[row.names(rpk.norm$samples),]$bbduk
rpk.norm$samples$lib.size
rpk.norm$samples
rpk.norm <- calcNormFactors(rpk.norm)
rpk.norm$samples
getmms <- cpm(rpk.norm)

getmms_df = as.data.frame(getmms)
range(getmms_df) #0 29,350,293,688
sum(is.na(getmms_df)) #check for NA values, should be 0

getmms_df$ID=row.names(getmms)
tail(getmms_df)
write.csv(getmms_df, 'getmm_gene.csv',quote = FALSE)

