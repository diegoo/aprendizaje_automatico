# lo que explica Alejo, para 1 archivo (i.e., 1 imagen):

# source('funciones_para_TP.R')
# data = read.csv('train/210-B.tuple', header = FALSE, sep = ',', na.strings = "NA")
# x = data
# x=data[-257]
# x=lapply(x,grisesCeroUno)
# x = as.matrix(x,nrow = 1, ncol = 256)
# hist_crudo = histColsRaw(x,16,16, normalizar = FALSE)
# plot(1:16, hist_crudo, type='l')
# hist_crudo = histColsRaw(x,16,16, normalizar = TRUE)
# plot(1:16, hist_crudo, type='l')
# x1 = nonZeroHist(hist_crudo)
# x2 = normalizeHist(x1, n.out = 6, N = 36)
# x2 = normalizeHist(x1, n.out = 20, N = 40)
# plot(1:20, x2, type = 'l')

# lo que Alejo explica para el dataset entero:

class_ind = 257
data = read.csv('train.tuples', header = TRUE, sep = ',', na.strings = "NA")
data01 = normalizeData01(data, class_ind)
colfeatures = creaColFeatures(datos01 = data01, nr_rows = 16, nr_cols = 16, spline.points = 40, Nout = 20)

# -----------------------------------------------------------------------------------------------------------------------------
# ... esto es lo que agregué para que tenga forma de dataset posta:

# 1) el mismo proceso que aplicó para las columnas, ahora para las filas:

rowfeatures = creaRowFeatures(datos01 = data01, nr_rows = 16, nr_cols = 16, spline.points = 40, Nout = 20)

# 2) hay que recuperar del dataset original las clases asignadas:

train_data <- read.csv('train.tuples', sep=',', header=TRUE)
clases <- as.matrix(train_data[,257])

# pegamos horizontalmente todo: cada imagen queda como un vector de 41 valores (20 features de columna, 20 de fila, y la clase):

dataset <- cbind(rowfeatures, colfeatures, clases)

# exportamos a .csv

library(MASS)
write.matrix(format(dataset, scientific=FALSE), file='dataset.tuples', sep=',')

# y finalmente borramos whitespace espurio:
# sed 's/\s*//g' dataset.tuples > dataset_training.tuples