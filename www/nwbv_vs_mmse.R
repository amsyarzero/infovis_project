# Hypothesis 2: Do age, years of education, socioeconomic status, and brain volume affect dementia?
# run function from import.R
source("./www/import.R")
importLibrary()

# import base dataset
alzheimer <- read_csv("./www/alzheimer.csv")

# remove Converted and Nondemented and set to only Age vs. MMSE
removeConverted <- subset(alzheimer, Group != "Converted" & Group != "Nondemented", select = c("Group", "nWBV", "MMSE"))

# create scatter plot
scatterNwbvVsMMSE <- ggplot(data = removeConverted, aes(x = nWBV, y = MMSE)) +
  geom_point(color = "#1D568A") +
  
  # stylise graph
  theme_calc() +
  labs(title = "Normalized Whole Brain Volume vs. Mini-Mental State Examination") +
  theme(plot.title = element_text(hjust = 0.5), axis.title = element_text(face = "bold")) +
  xlab("Brain Volume") +
  ylab("Examination points")

# interactive time
ggplotly(scatterNwbvVsMMSE)