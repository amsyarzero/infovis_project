# Hypotheses 1: Do males have more amount of patients afflicted with Alzheimer's than females?
# run import.R
source("./www/import.R")
importLibrary()

# import base dataset
alzheimer <- read_csv("./www/alzheimer.csv")

# remove Converted because what is even that
removeConverted <- subset(alzheimer, Group != "Converted", select = c("Group", "M/F"))

# create variables
gender <- c("Male", "Male", "Female", "Female")
group <- c("Demented", "Nondemented")

maleDemented <- nrow(removeConverted[removeConverted$`M/F` == "M" & removeConverted$Group == "Demented", ])
maleNondemented <- nrow(removeConverted[removeConverted$`M/F` == "M" & removeConverted$Group != "Demented", ])
femaleDemented <- nrow(removeConverted[removeConverted$`M/F` != "M" & removeConverted$Group == "Demented", ])
femaleNondemented <- nrow(removeConverted[removeConverted$`M/F` != "M" & removeConverted$Group != "Demented", ])
groupCount <- c(maleDemented, maleNondemented, femaleDemented, femaleNondemented)

genderVsGroupCount <- data.frame(gender, group, groupCount)

# create grouped bar chart
barGenderVsGroup <- ggplot(genderVsGroupCount, aes(fill = group, x = gender, y = groupCount)) +
  geom_bar(position = 'dodge', stat = 'identity') +

  # stylise graph
  theme_calc() +
  labs(title = "Gender vs. Amount of Demented and Nondemented Patients", fill = "Condition") +
  theme(plot.title = element_text(hjust = 0.5), axis.title = element_text(face = "bold")) +
  xlab("Gender") + 
  ylab("Amount of patients")

# interactive time
ggplotly(barGenderVsGroup)
