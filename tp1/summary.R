dataset <- read.table("dataset.csv", header=TRUE, sep = ';')
summary(dataset)
names(sort(table(dataset$x), decreasing=TRUE))[1]
