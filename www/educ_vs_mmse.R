# Hypothesis 2: Do age, years of education, socioeconomic status, and brain volume affect dementia?
# run function from import.R
source("./www/import.R")
importLibrary()

# import base dataset
alzheimer <- read_csv("./www/alzheimer.csv")

# remove Converted and Nondemented and set to only Age vs. MMSE
removeConverted <- subset(alzheimer, Group != "Converted" & Group != "Nondemented", select = c("Group", "EDUC", "MMSE"))

# create scatter plot
scatterEducVsMMSE <- ggplot(data = removeConverted, aes(x = EDUC, y = MMSE)) +
  geom_point(color = "#1D568A") +
  
  # stylise graph
  theme_calc() +
  labs(title = "Years of Education vs. Mini-Mental State Examination") +
  theme(plot.title = element_text(hjust = 0.5), axis.title = element_text(face = "bold")) +
  xlab("Year") +
  ylab("Examination points")

# interactive time
ggplotly(scatterEducVsMMSE)