# Extension of hypotheses 1
# run import.R
source("./www/import.R")
importLibrary()

# import base dataset
alzheimer <- read_csv("./www/alzheimer.csv")

# remove Converted because what is even that
removeConverted <- subset(alzheimer, Group != "Converted", select = c("Group", "M/F"))

# create variables
gender <- c("Male", "Female")
group <- c("Demented", "Nondemented")

maleDemented <- nrow(removeConverted[removeConverted$`M/F` == "M" & removeConverted$Group == "Demented", ])
maleNondemented <- nrow(removeConverted[removeConverted$`M/F` == "M" & removeConverted$Group != "Demented", ])
femaleDemented <- nrow(removeConverted[removeConverted$`M/F` != "M" & removeConverted$Group == "Demented", ])
femaleNondemented <- nrow(removeConverted[removeConverted$`M/F` != "M" & removeConverted$Group != "Demented", ])

maleCount <- c(maleDemented, maleNondemented)
femaleCount <- c(femaleDemented, femaleNondemented)

maleGenderVsGroup <- data.frame(gender, group, maleCount)
femaleGenderVsGroup <- data.frame(gender, group, femaleCount)

# compute fraction
