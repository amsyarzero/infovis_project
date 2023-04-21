# Hypothesis 2: Do age, years of education, socioeconomic status, and brain volume affect dementia?
# run function from import.R
source("./www/import.R")
importLibrary()

# import base dataset
alzheimer <- read_csv("./www/alzheimer.csv")

# remove Converted and Nondemented and set to only Age vs. CDR
removeConverted <- subset(alzheimer, Group != "Converted" & Group != "Nondemented", select = c("Group", "EDUC", "CDR"))

# create scatter plot
scatterEducVsCDR <- ggplot(data = removeConverted, aes(x = EDUC, y = CDR)) +
  geom_point(color = "#56008C") +
  
  # stylise graph
  theme_calc() +
  labs(title = "Years of Education vs. Clinical Dementia Rating") +
  theme(plot.title = element_text(hjust = 0.5), axis.title = element_text(face = "bold")) +
  xlab("Year") +
  ylab("Rating")

# interactive time
ggplotly(scatterEducVsCDR)