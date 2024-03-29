# I'm sorry, but splitting this code into seperate files really doesn't make a lot of sense to me.

# Setup
library(tidyverse)
setwd("C:/Users/flech/OneDrive/Dokumente/uni/data_mining/data_mining_ex_0/data_mining_ex_0")
data <- read_csv("data/ess.csv")
head(data)
  
# First, we filter the dataset to remove values above 10 in 'trstprl' and 'ppltrst'
filtered_data <- data %>%
  filter(trstprl <= 10, ppltrst <= 10)

# Now, we create boxplots for each 'ppltrst' value
plot <- ggplot(filtered_data, aes(x = as.factor(ppltrst), y = trstprl)) +
  geom_boxplot() +
  labs(x = "Trust in People", y = "Trust in Parliament") +
  theme_minimal()
ggsave("plot/boxplot.png", plot)

# Then, we perform a  linear regression with 'trstprl' as dependent and 'ppltrst' independent 
model <- lm(trstprl ~ ppltrst, data = filtered_data)

# Finally, we print the regression table of the model
summary(model)
