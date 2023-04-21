# Hypothesis 2: Do age, years of education, socioeconomic status, and brain volume affect dementia?
# run function from import.R
source("./www/import.R")
importLibrary()

# import base dataset
alzheimer <- read_csv("./www/alzheimer.csv")

# remove Converted and Nondemented and set to only Age vs. CDR
removeConverted <- subset(alzheimer, Group != "Converted" & Group != "Nondemented", select = c("Group", "Age", "CDR"))

# create scatter plot
scatterAgeVsCDR <- ggplot(data = removeConverted, aes(x = Age, y = CDR)) +
  geom_point(color = "#56008C") +
  
  # stylise graph
  theme_calc() +
  labs(title = "Age vs. Clinical Dementia Rating") +
  theme(plot.title = element_text(hjust = 0.5), axis.title = element_text(face = "bold")) +
  xlab("Age") +
  ylab("Rating")

# interactive time
ggplotly(scatterAgeVsCDR)