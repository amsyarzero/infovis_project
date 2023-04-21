# Hypothesis 2: Do age, years of education, socioeconomic status, and brain volume affect dementia?
# run function from import.R
source("./www/import.R")
importLibrary()

# import base dataset
alzheimer <- read_csv("./www/alzheimer.csv")

# remove Converted and Nondemented and set to only Age vs. MMSE
removeConverted <- subset(alzheimer, Group != "Converted" & Group != "Nondemented", select = c("Group", "SES", "eTIV"))

# create scatter plot
scatterSesVsETIV <- ggplot(data = removeConverted, aes(x = SES, y = eTIV)) +
  geom_bar(fill = "#043109", stat = "identity") +
  
  # stylise graph
  theme_calc() +
  labs(title = "Socioeconomic Status vs. Estimated Total Intracranial Volume") +
  theme(plot.title = element_text(hjust = 0.5), axis.title = element_text(face = "bold")) +
  xlab("Status") +
  ylab("Intracranial Volume")

# interactive time
ggplotly(scatterSesVsETIV)