# Hypotheses 1: Do males have more amount of patients afflicted with Alzheimer's than females?
# run import.R
source("./www/import.R")
importLibrary()

# import base dataset
alzheimer <- read_csv("./www/alzheimer.csv")

# remove Converted because what is even that
removeConverted <- subset(alzheimer, Group != "Converted", select = c("Group", "M/F"))

# create variables
sex <- c("Male", "Male", "Female", "Female")
group <- c("Demented", "Nondemented")

maleDemented <- nrow(removeConverted[removeConverted$`M/F` == "M" & removeConverted$Group == "Demented", ])
maleNondemented <- nrow(removeConverted[removeConverted$`M/F` == "M" & removeConverted$Group != "Demented", ])
femaleDemented <- nrow(removeConverted[removeConverted$`M/F` != "M" & removeConverted$Group == "Demented", ])
femaleNondemented <- nrow(removeConverted[removeConverted$`M/F` != "M" & removeConverted$Group != "Demented", ])
groupCount <- c(maleDemented, maleNondemented, femaleDemented, femaleNondemented)

sexVsGroupCount <- data.frame(sex, group, groupCount)

# create grouped bar chart
barSexVsGroup <- ggplot(sexVsGroupCount, aes(fill = group, x = sex, y = groupCount)) +
  geom_bar(position = 'dodge', stat = 'identity')

# interactive time
ggplotly(barSexVsGroup)
