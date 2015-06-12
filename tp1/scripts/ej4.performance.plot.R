require(ggplot2)

performance_ancho_training <- read.csv('output/ej.4/performance.igual.ancho.training.csv', header=TRUE)
performance_ancho_test <- read.csv('output/ej.4/performance.igual.ancho.test.csv', header=TRUE)

performance_frecuencia_training <- read.csv('output/ej.4/performance.igual.frecuencia.training.csv', header=TRUE)
performance_frecuencia_test <- read.csv('output/ej.4/performance.igual.frecuencia.test.csv', header=TRUE)

performance_supervisado_training <- read.csv('output/ej.4/performance.supervisado.training.csv', header=TRUE)
performance_supervisado_test <- read.csv('output/ej.4/performance.supervisado.test.csv', header=TRUE)

bins <- performance_ancho_training$number_of_bins

ancho_training_accuracy <- performance_ancho_training$accuracy
ancho_test_accuracy <- performance_ancho_test$accuracy

frecuencia_training_accuracy <- performance_frecuencia_training$accuracy
frecuencia_test_accuracy <- performance_frecuencia_test$accuracy

supervisado_training_accuracy <- performance_supervisado_training$accuracy
supervisado_test_accuracy <- performance_supervisado_test$accuracy

df <- data.frame(cf, ancho_training_accuracy, ancho_test_accuracy, frecuencia_training_accuracy, frecuencia_test_accuracy, supervisado_training_accuracy, supervisado_test_accuracy)

ggplot(df, aes(bins)) + geom_line(aes(y=ancho_training_accuracy, colour="training")) + geom_line(aes(y=ancho_test_accuracy, colour="test")) + xlab("Cantidad de Bins") + ylab("Accuracy") + scale_colour_manual("", values = c("training"="green", "test"="red")) + ggtitle("Performance por Cantidad de Bins (estrategia: bins de igual ancho)")

ggsave("ej.4.performance.training.vs.test.igual.ancho.png", width=12, height=6, dpi=100)

ggplot(df, aes(bins)) + geom_line(aes(y=frecuencia_training_accuracy, colour="training")) + geom_line(aes(y=frecuencia_test_accuracy, colour="test")) + xlab("Cantidad de Bins") + ylab("Accuracy") + scale_colour_manual("", values = c("training"="green", "test"="red")) + ggtitle("Performance por Cantidad de Bins (estrategia: bins de igual frecuencia)")

ggsave("ej.4.performance.training.vs.test.igual.frecuencia.png", width=12, height=6, dpi=100)

ggplot(df, aes(bins)) + geom_line(aes(y=supervisado_training_accuracy, colour="training")) + geom_line(aes(y=supervisado_test_accuracy, colour="test")) + xlab("Cantidad de Bins") + ylab("Accuracy") + scale_colour_manual("", values = c("training"="green", "test"="red")) + ggtitle("Performance por Cantidad de Bins (estrategia: discretización supervisada)")

ggsave("ej.4.performance.training.vs.test.supervisado.png", width=12, height=6, dpi=100)