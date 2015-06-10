ej12 <- read.csv('output/ej1.punto.2.resultados.csv')

# png('ej.1.2.1.png')
# plot(x=ej12$confidence_factor, y=ej12$number_of_leaves, xlab="confidence factor (función de poda)", ylab="cantidad de hojas")
# dev.off()

# png('ej.1.2.2.png')
# plot(x=ej12$confidence_factor, y=ej12$size_of_the_tree, xlab="confidence factor (función de poda)", ylab="tamaño del árbol")
# dev.off()

png('ej.1.2.png')
jpg('ej.1.2.jpg')
plot(x=ej12$confidence_factor, y=ej12$total_tree_size, xlab="función de poda (confidence factor)", ylab="tamaño del árbol (hojas + nodos)")
dev.off()
