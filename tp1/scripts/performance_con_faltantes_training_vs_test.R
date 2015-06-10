require(ggplot2)

test     <- read.csv('output/ej.2/modaatributo/performance.test.csv')
training <- read.csv('output/ej.2/modaatributo/performance.training.csv')

confidence_factor    <- test$confidence_factor
test_performance     <- test$accuracy
training_performance <- training$accuracy

df <- data.frame(x, training_performance, test_performance)

# dm  <- melt(df,id.var=1)
#   ggplot(data=dm,aes(x,value,colour=variable))+
#   geom_point(alpha=0.2)+
#   scale_colour_manual(value=c("red","blue"))+
#   labs(x="games",y="variance")

training_plot <- ggplot(df, aes(x=x, y=training_performance, colour="Training")) + geom_point(shape=1) + geom_smooth() + xlab("Confidence Factor") + ylab("Accuracy") + scale_colour_manual("", values = c("Training"="green", "Test"="red")) # + ggtitle("Performance con datos faltantes (rellenados con moda del atributo)")

test_plot <- ggplot(df, aes(x=confidence_factor, y=test_performance, colour="Test")) + geom_point(shape=1) + geom_smooth() + xlab("Confidence Factor") + ylab("Accuracy") + scale_colour_manual("", values = c("Training"="green", "Test"="red")) # + ggtitle("Performance con datos faltantes (rellenados con moda del atributo)")

library(gridExtra)
grid.arrange(training_plot, test_plot, ncol=2, nrow=1, main="Performance con faltantes (rellenados con moda del atributo)", widths=c(12, 12))

ggsave("performance_con_faltantes_training_vs_test.png", width=12, height=7, dpi=100)

# qplot(x, value, data = melt(df, measure.vars=c("training_performance", "test_performance")), colour=variable)


plot(confidence_factor)
points(training_performance)
points(training_performance)



library(lattice)
xyplot(accuracy ~ training + test, data=df)
xyplot(a1 + a2 + a3 ~ count, data=df)