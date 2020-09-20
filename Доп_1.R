#1
#Создаю свой датафрейм, рандомно ввожу NA, с помощью dplyr удаляю
library(dplyr)
my_data = as.data.frame(matrix(sample(c(1:20, rep(NA, 5))), 5))#использовал sample из базового R

my_data_without_NA = my_data %>% mutate_all(~ifelse(is.na(.x), mean(.x, na.rm = TRUE), .x))


#2
library(ggplot2)
library(DAAG)
data("leafshape")
leafshape$arch <- factor(leafshape$arch, labels = c("Plagiotropic", "Orthotropic"))
ggplot(leafshape, aes(location, bladelen)) + 
  geom_violin(aes(fill = location, )) + 
  facet_grid(~arch) + 
  labs(title = 'Leaf parameters', x='Location/architecture', y = 'Leaf Length', caption = "from leafshape dataset", fill = 'Location') +
  theme_bw() + 
  scale_fill_brewer(palette = "Dark2") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + theme(axis.title=element_text(size=10,face="bold")) + 
  theme(legend.position = "right") + theme(plot.title = element_text(size=16))
