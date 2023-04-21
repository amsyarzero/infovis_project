# Hypothesis 2: Do age, years of education, socioeconomic status, and brain volume affect dementia?
# run function from import.R
source("./www/import.R")
importLibrary()

# import base dataset
alzheimer <- read_csv("./www/alzheimer.csv")

# remove Converted and Nondemented and set to only Age vs. MMSE
removeConverted <- subset(alzheimer, Group != "Converted" & Group != "Nondemented", select = c("Group", "SES", "MMSE"))

# create scatter plot
scatterSesVsMMSE <- ggplot(data = removeConverted, aes(x = SES, y = MMSE)) +
  geom_bar(fill = "#1D568A", stat = "identity") +
  
  # stylise graph
  theme_calc() +
  labs(title = "Socioeconomic Status vs. Mini-Mental State Examination") +
  theme(plot.title = element_text(hjust = 0.5), axis.title = element_text(face = "bold")) +
  xlab("Status") +
  ylab("Examination points")

# interactive time
ggplotly(scatterSesVsMMSE)