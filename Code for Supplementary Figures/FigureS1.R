# Libraries
library(ggplot2) 
library(ggsignif) 
library(gghalves)

# read dataset
top38_prevalenceARG_abun <- read.delim('top38_prevalenceARG_abun.txt', row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE,na.strings="na")

# create a dataset
data_long_temp <- pivot_longer(top38_prevalenceARG_abun, cols = -c(sample, Host), names_to = "ARGs_subtype", values_to = "Value")
quantiles <- data_long_temp %>%
  group_by(ARGs_subtype) %>%
  summarize(low = quantile(Value, probs = 0.01),high = quantile(Value, probs = 0.99))
data_long_temp <- data_long_temp %>%
  left_join(quantiles, by = "ARGs_subtype") %>%
  filter(Value > low, Value < high)

# Plot
ggplot(data_long_temp,aes(Host,Value,fill=Host))+
  geom_half_violin(position = position_nudge(x=0.2),side = "r",width=1,color=NA)+
  geom_boxplot(width=0.3,size=0.5,outlier.color =NA)+
  geom_jitter(aes(fill=Host),shape=21,size=1,width=0.1,color="white")+
  facet_wrap(~ARGs_subtype,scales = "free_y", nrow = 10)+
  theme_bw()+
  theme(panel.grid = element_blank(),
        panel.border = element_rect(size = 1),
        text = element_text(size = 20), # Default text size, can be adjusted
        axis.text.x = element_text(color = "black", size = 18),
        axis.text.y = element_text(color = "black",size = 18),
        legend.position = "bottom",
        axis.ticks = element_line(color="black",linewidth = 1))+
  labs(x="",y="")+
  scale_fill_manual(values = c("bovine"="#ee8866","chicken"="#eedd88","swine"="#77aadd"))
