ej13_training <- read.csv('output/ej1.punto.3.performance.training.csv')

png('ej.1.3.training.correctos.png')
plot(x=ej13_training$confidence_factor, y=ej13_training$correctly_classified, xlab="función de poda (confidence factor)", ylab="clasificados correctamente - training")
dev.off()

png('ej.1.3.training.incorrectos.png')
plot(x=ej13_training$confidence_factor, y=ej13_training$incorrectly_classified, xlab="función de poda (confidence factor)", ylab="clasificados incorrectamente - training")
dev.off()

ej13_testing <- read.csv('output/ej1.punto.3.performance.testing.csv')

png('ej.1.3.testing.correctos.png')
plot(x=ej13_testing$confidence_factor, y=ej13_testing$correctly_classified, xlab="función de poda (confidence factor)", ylab="clasificados correctamente - testing")
dev.off()

png('ej.1.3.testing.incorrectos.png')
plot(x=ej13_testing$confidence_factor, y=ej13_testing$incorrectly_classified, xlab="función de poda (confidence factor)", ylab="clasificados incorrectamente - testing")
dev.off()
