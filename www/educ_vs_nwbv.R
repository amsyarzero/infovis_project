# Hypothesis 2: Do age, years of education, socioeconomic status, and brain volume affect dementia?
# run function from import.R
source("./www/import.R")
importLibrary()

# import base dataset
alzheimer <- read_csv("./www/alzheimer.csv")

# remove Converted and Nondemented and set to only Age vs. MMSE
removeConverted <- subset(alzheimer, Group != "Converted" & Group != "Nondemented", select = c("Group", "EDUC", "nWBV"))

# create scatter plot
scatterEducVsNWBV <- ggplot(data = removeConverted, aes(x = EDUC, y = nWBV)) +
  geom_point(color = "#043109") +
  
  # stylise graph
  theme_calc() +
  labs(title = "Years of Education vs. Normalized Whole Brain Volume") +
  theme(plot.title = element_text(hjust = 0.5), axis.title = element_text(face = "bold")) +
  xlab("Year") +
  ylab("Brain Volume")

# interactive time
ggplotly(scatterEducVsNWBV)