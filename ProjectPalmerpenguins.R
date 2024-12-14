install.packages("gganimate")
install.packages("av")
install.packages("gifski")
install.packages("gapminder")
install.packages("tidyverse")
install.packages("dplyr")
install.packages("gifski")
install.packages("av")
install.packages("viridis")
install.packages("palmerpenguins")
install.packages("RColorBrewer")
install.packages("GGally")
library(GGally)
library(RColorBrewer)
library(gganimate)
library(viridis)
library(RColorBrewer)
library(tidyverse)
library(gapminder)
library(palmerpenguins)
view(penguins)
view(penguins_raw)

penguins %>%
  drop_na(sex)%>%
  ggplot(aes(bill_length_mm, fill = sex))+
  geom_histogram(color = "grey")+
  facet_wrap(~species)+
  theme_bw()+
  scale_fill_brewer()



penguins %>%
  ggplot(aes(flipper_length_mm, color = species))+
  geom_boxplot(alpha = 0.5)+
  facet_wrap(species~island)

penguins%>%
  filter(sex != "NA")%>%
  ggplot(aes(body_mass_g, color = sex))+
  geom_boxplot(, alpha = 0.5)+
  theme_bw()+
  facet_wrap(sex~species)+
  coord_flip()

penguins %>%
  drop_na() %>%
  ggplot(aes(x = bill_length_mm, fill = species)) +
  geom_histogram(color = "black", bins = 30, alpha = 0.7) +
  scale_fill_brewer(palette = "Set2") +
  theme_minimal() +
  labs(title = "Distribution of Bill Lengths by Species", x = "Bill Length (mm)", y = "Count")

penguins %>%
  drop_na() %>%
  ggplot(aes(x = species, y = body_mass_g, fill = species)) +
  geom_boxplot(alpha = 0.7) +
  scale_fill_viridis(discrete = TRUE, option = "A") +
  theme_minimal() +
  labs(title = "Body Mass Distribution by Species", x = "Species", y = "Body Mass (g)")

library(gganimate)

penguins %>%
  drop_na() %>%
  ggplot(aes(x = flipper_length_mm, y = bill_depth_mm, color = species)) +
  geom_point(alpha = 0.7, size = 3) +
  scale_color_viridis(discrete = TRUE) +
  labs(title = "Flipper Length vs. Bill Depth", x = "Flipper Length (mm)", y = "Bill Depth (mm)") +
  theme_minimal() +
  transition_time(year) +
  labs(subtitle = 'Year: {frame_time}')

penguins %>%
  drop_na() %>%
  group_by(year, species) %>%
  summarize(avg_bill_length = mean(bill_length_mm, na.rm = TRUE)) %>%
  ggplot(aes(x = year, y = avg_bill_length, color = species, group = species)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  scale_color_brewer(palette = "Set1") +
  theme_minimal() +
  labs(title = "Average Bill Length Over Time", x = "Year", y = "Average Bill Length (mm)") +
  theme(legend.position = "top")

penguins %>%
  drop_na() %>%
  ggplot(aes(x = bill_length_mm, y = body_mass_g, color = species)) +
  geom_point(alpha = 0.7, size = 3) +
  scale_color_brewer(palette = "Dark2") +
  facet_wrap(~ island) +
  theme_minimal() +
  labs(title = "Bill Length vs. Body Mass by Island", x = "Bill Length (mm)", y = "Body Mass (g)")


# Histogram of bill length by species
penguins %>%
  ggplot(aes(x = bill_length_mm, fill = species)) +
  geom_histogram(position = "dodge", bins = 30, color = "black") +
  scale_fill_viridis_d() +
  theme_minimal() +
  labs(title = "Distribution of Bill Length by Species", x = "Bill Length (mm)", y = "Count")

# Scatter plot for bill length vs. flipper length
penguins %>%
  ggplot(aes(x = bill_length_mm, y = flipper_length_mm, color = species)) +
  geom_point(size = 3, alpha = 0.7) +
  scale_color_brewer(palette = "Set1") +
  theme_minimal() +
  labs(title = "Bill Length vs. Flipper Length by Species", x = "Bill Length (mm)", y = "Flipper Length (mm)")

# Facet plot for body mass by island
penguins %>%
  ggplot(aes(x = body_mass_g, fill = species)) +
  geom_density(alpha = 0.6) +
  facet_wrap(~island) +
  scale_fill_brewer(palette = "Set3") +
  theme_minimal() +
  labs(title = "Density Plot of Body Mass by Island", x = "Body Mass (g)", y = "Density")

# Animated plot showing changes over years
penguins %>%
  drop_na(year, bill_length_mm, body_mass_g) %>%
  ggplot(aes(x = bill_length_mm, y = body_mass_g, color = species)) +
  geom_point(size = 4, alpha = 0.8) +
  transition_time(year) +
  labs(title = 'Year: {frame_time}', x = 'Bill Length (mm)', y = 'Body Mass (g)') +
  theme_minimal() +
  scale_color_viridis_d()

# Boxplot of flipper length by species and sex
penguins %>%
  drop_na(sex) %>%
  ggplot(aes(x = species, y = flipper_length_mm, fill = sex)) +
  geom_boxplot() +
  scale_fill_viridis_d(option = "C") +
  theme_minimal() +
  labs(title = "Flipper Length by Species and Sex", x = "Species", y = "Flipper Length (mm)")


penguins %>%
  select(bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g) %>%
  ggpairs(aes(color = penguins$species, alpha = 0.7)) +
  theme_minimal() +
  scale_color_brewer(palette = "Set2")

penguins %>%
  ggplot(aes(x = island, fill = species)) +
  geom_bar(position = "dodge") +
  scale_fill_brewer(palette = "Pastel1") +
  theme_minimal() +
  labs(title = "Distribution of Penguin Species by Island", x = "Island", y = "Count")

