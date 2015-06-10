require(ggplot2)

ej131 <- read.csv('output/ej.1/ej1.punto.3.performance.training.csv')

x <- ej131$confidence_factor       # xlab="función de poda (confidence factor)", 
y1 <- ej131$correctly_classified   # ylab="clasificados correctamente")
y2 <- ej131$incorrectly_classified # ylab="clasificados incorrectamente")

df <- data.frame(x, y1, y2)

ggplot(df, aes(x)) + geom_line(aes(y=y1, colour="correctamente clasificado")) + geom_line(aes(y=y2, colour="incorrectamente clasificado")) + xlab("confidence factor") + ylab("votantes") + scale_colour_manual("", values = c("correctamente clasificado"="green", "incorrectamente clasificado"="red")) + ggtitle("Performance de clasificación sobre dataset de training")

ggsave("ej.1.3.png", width=6, height=6, dpi=100)
