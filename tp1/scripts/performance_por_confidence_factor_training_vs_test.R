require(ggplot2)

training <- read.csv('output/ej.1/performance.on.training.csv')
test <- read.csv('output/ej.1/performance.on.test.csv')

x <- training$confidence_factor       
y1 <- training$accuracy
y2 <- test$accuracy

df <- data.frame(x, y1, y2)

ggplot(df, aes(x)) + geom_line(aes(y=y1, colour="training")) + geom_line(aes(y=y2, colour="test")) + xlab("Función de poda (Confidence Factor)") + ylab("Accuracy") + scale_colour_manual("", values = c("training"="blue", "test"="red")) + ggtitle("Performance por Confidence Factor: Training vs Test")

ggsave("performance_por_confidence_factor_training_vs_test.png", width=12, height=6, dpi=100)
