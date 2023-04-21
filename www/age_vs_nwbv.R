# Hypothesis 2: Do age, years of education, socioeconomic status, and brain volume affect dementia?
# run function from import.R
source("./www/import.R")
importLibrary()

# import base dataset
alzheimer <- read_csv("./www/alzheimer.csv")

# remove Converted and Nondemented and set to only Age vs. MMSE
removeConverted <- subset(alzheimer, Group != "Converted" & Group != "Nondemented", select = c("Group", "Age", "nWBV"))

# create scatter plot
scatterAgeVsNWBV <- ggplot(data = removeConverted, aes(x = Age, y = nWBV)) +
  geom_point(color = "#043109") +
  
  # stylise graph
  theme_calc() +
  labs(title = "Age vs. Normalized Whole Brain Volume") +
  theme(plot.title = element_text(hjust = 0.5), axis.title = element_text(face = "bold")) +
  xlab("Age") +
  ylab("Brain Volume")

# interactive time
ggplotly(scatterAgeVsNWBV)