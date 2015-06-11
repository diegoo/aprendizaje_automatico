require(ggplot2)

test     <- read.csv('output/ej.2/modaatributo/treesize.test.csv')
training <- read.csv('output/ej.2/modaatributo/treesize.training.csv')

test_missing_percentage		<- test$missing_percentage
test_treesize     		<- test$tree_size

training_missing_percentage 	<- training$missing_percentage
training_treesize 		<- training$tree_size

df <- data.frame(confidence_factor, training_treesize, test_treesize)

training_plot <- ggplot(df, aes(x=training_missing_percentage, y=training_treesize, colour="Training")) + geom_point(shape=1) + geom_smooth() + xlab("% de datos faltantes rellenados") + ylab("Tamaño del árbol") + scale_colour_manual("", values = c("Training"="green"))

test_plot <- ggplot(df, aes(x=test_missing_percentage, y=test_treesize, colour="Test")) + geom_point(shape=1) + geom_smooth() + xlab("% de datos faltantes rellenados") + ylab("Tamaño del árbol") + scale_colour_manual("", values = c("Test"="red"))

# library(gridExtra)
# grid.arrange(training_plot, test_plot, ncol=2, nrow=1, main="Tamaño del árbol con faltantes (rellenados con moda del atributo)", widths=c(12, 12))

ggplot(df, aes(x=test_missing_percentage, y=test_treesize, colour="Test")) + geom_point(shape=1) + geom_smooth() + xlab("% de datos faltantes rellenados") + ylab("Tamaño del árbol") + scale_colour_manual("", values = c("Test"="red"))

# ggplot(df, aes(x=confidence_factor)) + geom_point(aes(y=training_treesize, colour="Training"), shape=3, size=10) + geom_point(aes(y=test_treesize, colour="Test"), shape=2, colour="red")

ggsave("tree_size_con_faltantes_moda_atributo.png", width=12, height=7, dpi=100)