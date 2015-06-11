require(ggplot2)

ancho <- read.csv('output/ej.4/treesize.igual.ancho.csv', header=TRUE)
frecuencia <- read.csv('output/ej.4/treesize.igual.frecuencia.csv', header=TRUE)
supervisado <- read.csv('output/ej.4/treesize.supervisado.csv', header=TRUE)

cf <- ancho$confidence_factor       

ancho_bins <- ancho$number_of_bins   
ancho_treesize <- ancho$size_of_the_tree 

frecuencia_bins <- frecuencia$number_of_bins   
frecuencia_treesize <- frecuencia$size_of_the_tree

supervisado_treesize <- supervisado$size_of_the_tree
supervisado_treesize <- supervisado$size_of_the_tree

df <- data.frame(cf, ancho_treesize, frecuencia_treesize, supervisado_treesize)

ggplot(df, aes(cf)) + geom_point(aes(y=ancho_treesize, colour="igual ancho")) + geom_jitter(aes(y=frecuencia_treesize, colour="igual frecuencia")) + geom_jitter(aes(y=supervisado_treesize, colour="supervisado")) + xlab("Confidence Factor") + ylab("Tamaño del Árbol") + scale_colour_manual("", values = c("igual ancho"="blue", "igual frecuencia"="red", "supervisado"="green")) + ggtitle("Tamaño del Árbol por Confidence Factor (en datasets discretizados)")

ggsave("ej.4.tree.size.vs.confidence.factor.png", width=12, height=6, dpi=100)

ggplot(df, aes(ancho_bins)) + geom_line(aes(y=ancho_treesize, colour="igual ancho")) + geom_line(aes(y=frecuencia_treesize, colour="igual frecuencia")) + geom_line(aes(y=supervisado_treesize, colour="supervisado")) + xlab("Cantidad de Bins") + ylab("Tamaño del Árbol") + scale_colour_manual("", values = c("igual ancho"="blue", "igual frecuencia"="red", "supervisado"="green")) + ggtitle("Tamaño del Árbol por Cantidad de Bins (en datasets discretizados)")

ggsave("ej.4.tree.size.vs.number.of.bins.png", width=12, height=6, dpi=100)
