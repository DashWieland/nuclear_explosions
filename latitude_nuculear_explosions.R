library(tidyverse)
library(maps)
library(ggthemes)
library(patchwork)


nuclear_explosions <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-08-20/nuclear_explosions.csv")

map <- ggplot() +
  borders("world", colour = "gray85", fill = "gray80") +
  theme_map() +
  geom_point(data = nuclear_explosions, aes(x = longitude, y = latitude))

hist <- ggplot(data = nuclear_explosions, 
       aes(x = latitude)) + 
  geom_histogram(bins = 10) + 
  coord_flip() + 
  scale_y_reverse()

hist + map + plot_layout(ncol = 2)