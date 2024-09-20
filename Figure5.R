# library
library(pheatmap)
library(tibble)
library(dplyr)

# create a dataset
heatmap_matrix <- read.delim('heatmap_matrix.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE,na.strings="na")

# Plot
pheatmap(t(heatmap_matrix),
         clustering_distance_rows = "euclidean",  
         clustering_distance_cols = "euclidean", 
         clustering_method = "complete",          
         cluster_cols = FALSE,                    
         cluster_rows = TRUE,                   
         scale = "row",                   
         color = colorRampPalette(c("#1f78b4", "white", "#ff7f00"))(255), 
         angle_col = 45,                        
         border_color = NA,                   
         fontsize = 12,                       
         legend_title = "Prevalence")          
