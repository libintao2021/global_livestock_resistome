# library
library(ggpubr)
library(tibble)
library(dplyr)
library(ggplot2)
library(vegan)

# read a dataset
all_human_abun_arg_with_region <- read.delim('all_human_abun_arg_with_region.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE,na.strings="na")
chicken_arg <- read.delim('chicken_cell_subtype.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE)
pig_arg <- read.delim('pig_cell_subtype.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE)
cow_arg <- read.delim('bovine_cell_subtype.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE)

# Plot
my_comparison <- list(c('swine','human'), c('human','bovine'),c('human','chicken'))
ggboxplot(all_human_abun_arg_with_region, x="Host", y="log2sum",
          add = "jitter", color = "Host",
          xlab = "",
          ylab = "Abundance of ARGs(log2(copies per cell))",
          ggtheme = theme_bw(),
          palette = c("#77aadd","#96c889","#eedd88","#ee8866"))+
         stat_compare_means(comparisons = my_comparison,method = "wilcox.test") + 
          theme(text=element_text(size = 18,color = "black"))

# create a dataset
chicken_arg_t <- data.frame(t(chicken_arg))
pig_arg_t <- data.frame(t(pig_arg))
cow_arg_t <- data.frame(t(cow_arg))
sp_chicken <- specaccum(chicken_arg_t, method = 'random')
summary(sp_chicken)
sp_pig <- specaccum(pig_arg_t, method = 'random')
summary(sp_pig)
sp_cow <- specaccum(cow_arg_t, method = 'random')
summary(sp_cow)
sp_human <- specaccum(human_arg_t, method = 'random')
summary(sp_human)

# Plot
plot(sp_chicken, ci.type = 'poly', col = 'black', lwd = 2, ci.lty = 0, ci.col = 'lightgoldenrod', xlab = "Number of samples", ylab = "Number of ARGs")
lines(sp_pig, ci.type = 'poly', col = 'black', lwd = 2, ci.lty = 0, ci.col = 'lightblue')
lines(sp_cow, ci.type = 'poly', col = 'black', lwd = 2, ci.lty = 0, ci.col = 'lightcoral')
lines(sp_human, ci.type = 'poly', col = 'black', lwd = 2, ci.lty = 0, ci.col = "#96c889")
