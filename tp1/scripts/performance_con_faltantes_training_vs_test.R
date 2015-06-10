require(ggplot2)

test <- read.csv('output/ej.2/modaatributo/performance.test.csv')

x <- test$confidence_factor
test_performance <- test$accuracy
training_performance <- test$accuracy

ggplot(df, aes(x=x, y=test_performance, colour="Test")) + geom_point(shape=1) + geom_smooth() + xlab("Confidence Factor") + ylab("Accuracy") + scale_colour_manual("", values = c("Training"="green", "Test"="red")) + ggtitle("Performance con datos faltantes (rellenados con moda del atributo)")

ggsave("performance_con_faltantes_training_vs_test.png", width=6, height=12, dpi=100)





# df <- data.frame(x, training_performance, test_performance)
# ggplot(df, aes(x)) + geom_line(aes(y=training_performance, colour="training performance")) + geom_line(aes(y=test_performance, colour="test performance")) + xlab("confidence factor") + ylab("Accuracy") + scale_colour_manual("", values = c("training performance"="green", "test performance"="red")) + ggtitle("Performance con datos faltantes (rellenados con moda del atributo)")
# ggsave("performance_con_faltantes_training_vs_test.png", width=6, height=12, dpi=100)

# plot(x, y)


