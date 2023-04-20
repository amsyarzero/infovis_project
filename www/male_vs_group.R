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

maleDemented <- nrow(removeConverted[removeConverted$`M/F` == "M" & removeConverted$Group == "Demented", ])
maleNondemented <- nrow(removeConverted[removeConverted$`M/F` == "M" & removeConverted$Group != "Demented", ])

maleCount <- c(maleDemented, maleNondemented)
maleVsGroup <- data.frame(group, maleCount)

# compute fractions/percentages
maleVsGroup$fraction = maleVsGroup$maleCount / sum(maleVsGroup$maleCount)

# make pie chart
maleVsGroup %>% group_by(group)
chartColor <- c("#BB0920", "#00548C")

pieMaleVsGroup <- maleVsGroup %>% plot_ly(labels = ~group, values = ~fraction, type = 'pie', textinfo = "label+percent",
                                          marker = list(colors = chartColor, line = list(color = "white", width = 1))
                                          )

pieMaleVsGroup <- pieMaleVsGroup %>% layout(title = "Percentages of Male Demented and Nondemented Patients",
                                            xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                                            yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

pieMaleVsGroup
