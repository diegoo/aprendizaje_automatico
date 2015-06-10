ej131 <- read.csv('output/ej1.punto.3.performance.training.csv')

png('ej.1.3.1.png')
plot(x=ej131$confidence_factor, y=ej131$correctly_classified, xlab="función de poda (confidence factor)", ylab="clasificados correctamente")
dev.off()

png('ej.1.3.2.png')
plot(x=ej131$confidence_factor, y=ej131$incorrectly_classified, xlab="función de poda (confidence factor)", ylab="clasificados incorrectamente")
dev.off()
