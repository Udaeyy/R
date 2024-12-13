# R
## Rstudio
install.packages("gganimate")

install.packages("av")

install.packages("gifski")

install.packages("gapminder")

install.packages("tidyverse")

install.packages("dplyr")

install.packages("gifski")

install.packages("av")

install.packages("viridis")


library(gganimate)

library(viridis)

library(RColorBrewer)

library(tidyverse)

library(gapminder)


data()





graph1 <- Orange %>%

  ggplot(aes(age, circumference, color = circumference,size = circumference)) +
  
  geom_point( alpha = 0.5) +
  
  geom_line() +
  
  facet_wrap(~Tree) +
  
  labs(title = "Age vs Circumference",
  
  x = "Age (days)",
       y = "Circumference (mm)") +
       
  theme_bw() +
  
  scale_color_viridis_c()

# Add animation to the plot
graph1.animation <- graph1 +

  transition_time(age) +
  
  labs(subtitle = 'Age: {frame_time}') +
  
  shadow_wake(wake_length = 0.1)
  

# Render and save the animation
animate(graph1.animation, height = 500, width = 800, fps = 30, duration = 15)

anim_save("graph1_animation.gif")



![file2ed03938793d](https://github.com/user-attachments/assets/19eb029e-5ebb-4735-a486-28a87c5875d1)

Orange %>%

  #filter(Tree == 1 | Tree == 2) %>%
  
  #filter(Tree %in% c(1,2))%>%
  
  ggplot(aes(Tree, circumference, color = Tree))+
  
  geom_boxplot()+
  
  coord_flip()+
  
  theme_bw()+
  
  theme(panel.grid.major = element_blank(),
  
  panel.grid.minor = element_blank(),
  
  legend.position = "none")+
  
  facet_wrap(~Tree)

![Rplot](https://github.com/user-attachments/assets/e986a401-97db-4cbc-b67f-1575fad48e1d)
