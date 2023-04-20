# Extension of hypotheses 1
# run import.R
source("./www/import.R")
importLibrary()

# import base dataset
alzheimer <- read_csv("./www/alzheimer.csv")

# remove Converted because what is even that
removeConverted <- subset(alzheimer, Group != "Converted", select = c("Group", "M/F"))

# create variables
group <- c("Demented", "Nondemented")

femaleDemented <- nrow(removeConverted[removeConverted$`M/F` != "M" & removeConverted$Group == "Demented", ])
femaleNondemented <- nrow(removeConverted[removeConverted$`M/F` != "M" & removeConverted$Group != "Demented", ])

femaleCount <- c(femaleDemented, femaleNondemented)
femaleVsGroup <- data.frame(group, femaleCount)

# compute fractions/percentages
femaleVsGroup$fraction = femaleVsGroup$femaleCount / sum(femaleVsGroup$femaleCount)

# make pie chart
femaleVsGroup %>% group_by(group)
chartColor <- c("#BB0920", "#00548C")

pieFemaleVsGroup <- femaleVsGroup %>% plot_ly(labels = ~group, values = ~fraction, type = 'pie', textinfo = "label+percent",
                                          marker = list(colors = chartColor, line = list(color = "white", width = 1))
)

pieFemaleVsGroup <- pieFemaleVsGroup %>% layout(title = "Percentages of Female Demented and Nondemented Patients",
                                            xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                                            yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

pieFemaleVsGroup