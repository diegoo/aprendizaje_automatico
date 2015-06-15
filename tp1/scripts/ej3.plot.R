require(ggplot2)

performance_training <- read.csv('output/ej.3/performance.ruido.training.accuracy.csv', header=TRUE)
performance_test <- read.csv('output/ej.3/performance.ruido.test.accuracy.csv', header=TRUE)
treesize_data <- read.csv('output/ej.3/treesize.ruido.csv', header=TRUE)

cf <- performance_training$confidence_factor
noise <- performance_training$noise_percentage
accuracy_test <- performance_test$accuracy
accuracy_training <- performance_training$accuracy
treesize <- treesize_data$size_of_the_tree

df <- data.frame(cf, noise, accuracy_training, accuracy_test, treesize)

ggplot(df, aes(noise)) + geom_point(aes(y=accuracy_training, colour="training")) + geom_jitter(aes(y=accuracy_test, colour="test")) + xlab("Nivel de Ruido") + ylab("Accuracy") + scale_colour_manual("", values = c("training"="blue", "test"="red")) + ggtitle("Performance por Nivel de Ruido")

ggsave("ej.3.performance.and.noise.training.vs.test.png", width=12, height=6, dpi=100)

ggplot(df, aes(x=cf, y=treesize)) + geom_point(shape=1, colour="green") + geom_smooth(method=loess) + xlab("Confidence Factor") + ylab("Tamaño del Árbol") + ggtitle("Tamaño del Árbol por Confidence Factor")

ggsave("ej.3.tree.size.vs.confidence.factor.png", width=12, height=6, dpi=100)