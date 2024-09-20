# Libraries
library(ggplot2)

# create a dataset
average_values_long_clean <- read.delim('average_values_long_clean.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE,na.strings="na")

# Plot
ggplot(average_values_long_clean, aes(x = hostcontinent, y = value, fill = hostcontinent)) +
  geom_boxplot(outlier.shape = NA) +  # 移除箱线图中的异常值显示
  geom_jitter(width = 0.2, alpha = 0.5, size = 0.5) +  # 用散点图显示数据点，并将点的大小缩小一半
  facet_wrap(~ antibiotic_type, scales = "free_y") +
  theme_bw() +
  labs(title = "Boxplots of Antibiotic Types by Host Continent",
       x = "",
       y = "ARG abundance(copies per cell)",
       fill = "Host Continent") +
  theme(axis.text.x = element_text(angle = 30, hjust = 1, size = 14),
        axis.text.y = element_text(size = 14),
        axis.title.x = element_text(size = 16),
        axis.title.y = element_text(size = 16),
        plot.title = element_text(size = 18),
        legend.title = element_text(size = 16),
        legend.text = element_text(size = 14),
        strip.text = element_text(size = 16))
