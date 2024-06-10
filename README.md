# HFDtimeseries
R scripts and data with descriptions for "Time resolved multi-omics reveals diverse metabolic strategies of Salmonella during diet-induced inflammation" paper. All raw data is deposited at the National Center for Biotechnology Information (NCBI) under accession number PRJNA348350. Salmonella pangenome is available via Zenodo (10.5281/zenodo.10479610) 

16SrRNA_data
This folder contains taxonomy (16SrRNA_taxonomy.csv), a raw feature table (16S_featuretable_paper.csv), a filtered feature table, and a relative abundance table (10readsin5samples_16S_rel_abun.csv). As the file name suggests, counts were filtered to ASVs with at least 10 reads in at least 5 samples. 

MetaT_data
This folder contains:
1. htseq_sal_gene_counts_rev.xlsx -The first tab is the htseq read counts with duplicates created through prodigal. The second tab is the htseq raw read counts which combines the duplicates. Tab three is a list of the duplicates and tab four is the ID key since htseq prefers to use numeric labeling.
2. DESeq2_normalization.R - This is the R script which demonstrates how DESeq2 was used. For more information, check the DESeq2 github. 
3. earlyvspeak.txt -This is the htseq raw count for samples in the early and peak phases.
4. earlyvspeak_metadata.txt - This is the metadata for the samples in the early and peak phases. We included information such as the round, the cage the mouse was from, the individual mouse, the day, and the infection phase. 
5. earlyvspeak_results.csv - Raw results from DESeq2. Negative log2foldchange values are peak and positive log2foldchange values are early.
6. peakvslate.txt -This is the htseq raw count for samples in the peak and late phases.
7. peakvslate_metadata.txt- This is the metadata for the samples in the peak and late phases. We included information such as the round, the cage the mouse was from, the individual mouse, the day, and the infection phase. 
8. peakvspost_results.csv - Raw results from DESeq2. Negative log2foldchange values are peak and positive log2foldchange values are late.
9. GeTMM_normalization.R - This is the R script for normalizing gene expression counting by GeTMM using edge R. For more information, check out the GeTMM github.
10. library_size.txt - This is the library size for all the samples.
11. Salmonella_gene_length.txt - This is the gene length for all the genes in the Salmonella pangenome.
12. getmm_gene.csv- These are the GeTMM normalized results. 

Figures Folder
Figure_1
This folder contains:
1. Figure_1.R script- This is the R script for creating the Salmonella Relative Abundance chart, the Lipocalin-2 boxplot, and the Respiratory Electron Acceptor Expression bar chart of Figure 1
2. Figure1_data.xlsx- The data for generating figure 1.

Figure_2
This folder contains:
1. Figure_2.R script- This is the R script for creating S3 expression lineplot of Figure 2B.
2. Figure2_data.xlsx- The data for generating figure 2B.

Figure_3
This folder contains:
1. Figure_3.R script- This is the R script for creating heatmap of Figure 3.
2. Figure3_data.xlsx- The data for generating figure 3.

Figure_4
This folder contains:
1. Figure_4.R script- This is the R script for creating NMDS with loadings, statistics for the NMDS and the carbon expression heatmap of Figure 4.
2. Figure4_data.xlsx and the carbon_heatmap_data_121323.xlsx - The data for generating figure 4.

Figure_5
This folder contains:
1. Figure_5.R script- This is the R script for creating the volcano plot between early and peak phases, the volcano plot between peak and late phases, the donut plot between early and peak phases, and the donut plot between the peak and late phases of Figure 5.
2. Figure5_data.xlsx- The data for generating figure 5.

Supplemental Figure Folder
Supplemental_figure_1
This folder contains:
1. Supp_figure1.R script- This is the R script for creating alpha diversity metrics and statistics featured in supplemental Figure 1.
2. Supp_Figure1.xlsx- The data for generating supplemental figure 1.

Supplemental_Figure_2
This folder contains:
1. FigureS2.R script- This is the R script for creating Salmonella relative abundance lineplots between chow and HFD mice over time.  
2. FigureS2.xlsx- The data for generating supplemental figure 2.

Supplemental_Figure_3
This folder contains:
1. FigureS3.R script- This is the R script for creating Salmonella relative abundance lineplot and the ASV barchart of supplemental Figure 3.  
2. FigureS3.xlsx- The data for generating supplemental figure 3.

Supplemental_Figure_4
This folder contains:
1. FigureS4.R script- This is the R script for creating metabolite boxplots of supplemental Figure 4.
2. FigureS4.xlsx- The data for generating supplemental figure 4.

Supplemental_Figure_5
This folder contains:
1. FigureS5.R script- This is the R script for creating the boxplots of a T3SS gene (invA) and a lactate dehydrogenase (lldD) of supplemental Figure 5.
2. FigureS5.xlsx- The data for generating supplemental figure 5.
   
Supplemental Figure 6 & 7
This folder contains:
1. FiguresS6and7.R script- This is the R script for creating the differential expression lollipop plots between early and peak phases and peak and late phases of supplemental Figures 6 and 7.
2. Figures6and&.xlsx- The data for generating supplemental figures 6 and 7.

Data_processing.txt is a file that contains Qiime 2 commands for 16S processing and metaT mapping commands.
