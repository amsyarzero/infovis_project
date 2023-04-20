# Hypotheses 1: Do males have more amount of patients afflicted with Alzheimer's than females?
# run import.R
source("./www/import.R")
importLibrary()
importDataset()

# make a small dataset containing only M/F and total of demented/nondemented
sexVsGroup <- aggregate(Group ~ `M/F`, data = alzheimer, FUN = sum, na.rm = TRUE)
sexVsGroup