# library
library(pheatmap)
library(tibble)
library(dplyr)

# create a dataset
heatmap_matrix <- read.delim('heatmap_matrix.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE,na.strings="na")

# Plot
pheatmap(t(heatmap_matrix),
         clustering_distance_rows = "euclidean",  # 行聚类使用的距离度量，保持欧几里得距离
         clustering_distance_cols = "euclidean",  # 列聚类使用的距离度量，也设置为欧几里得距离
         clustering_method = "complete",          # 聚类方法，保持为完全链接
         cluster_cols = FALSE,                    # 不对行进行聚类（因为你想置换行）
         cluster_rows = TRUE,                     # 对列进行聚类
         scale = "row",                        # 对行进行标准化
         color = colorRampPalette(c("#1f78b4", "white", "#ff7f00"))(255),  # 颜色设置
         angle_col = 45,                          # 列标签角度
         border_color = NA,                       # 去掉边框
         fontsize = 12,                           # 字体大小
         legend_title = "Prevalence")             # 图例标题
