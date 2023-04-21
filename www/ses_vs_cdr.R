# Hypothesis 2: Do age, years of education, socioeconomic status, and brain volume affect dementia?
# run function from import.R
source("./www/import.R")
importLibrary()

# import base dataset
alzheimer <- read_csv("./www/alzheimer.csv")

# remove Converted and Nondemented and set to only Age vs. CDR
removeConverted <- subset(alzheimer, Group != "Converted" & Group != "Nondemented", select = c("Group", "SES", "CDR"))

# create scatter plot
scatterSesVsCDR <- ggplot(data = removeConverted, aes(x = SES, y = CDR)) +
  geom_bar(fill = "#56008C", stat = "identity") +
  
  # stylise graph
  theme_calc() +
  labs(title = "Socioeconomic Status vs. Clinical Dementia Rating") +
  theme(plot.title = element_text(hjust = 0.5), axis.title = element_text(face = "bold")) +
  xlab("Status") +
  ylab("Rating")

# interactive time
ggplotly(scatterSesVsCDR)