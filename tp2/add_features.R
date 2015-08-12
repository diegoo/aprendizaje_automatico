options(digits=3, scipen=999)

datOri<-read.table("train.tuples", sep=",", stringsAsFactor=FALSE)
tab<-datOri[,ncol(datOri)]
m<-matrix(as.numeric(datOri[1,1:256]), nrow=16, ncol=16)

tabFeat<-data.frame()
k<-1
for (i in 1:length(tab))
{
  M<-matrix(as.numeric(datOri[i,1:256]), nrow=16, ncol=16)
  M<-M/max(M) # Norm todo por el maximo de todo
  tabFeat[k,1]<-1;
  tabFeat[k,2]<-sum(M);
  tabFeat[k,3]<-mean(apply(M, 2 ,function(x){sum(x)})); # Promedio de la suma de los columnas
  tabFeat[k,4]<-mean(apply(M, 1 ,function(x){sum(x)})); # Promedio o centroide
  tabFeat[k,5]<-median(M) # mediana  o Q2
  tabFeat[k,6]<-quantile(M)[2] # Q1 
  tabFeat[k,7]<-quantile(M)[3] # Q3
  tabFeat[k,8]<-sd(M) #Desvio estandard
  tabFeat[k,9] <-mean(apply(M, 2 ,function(x){min(x)})) #promedio de minimos por columna
  tabFeat[k,10] <-mean(apply(M, 1 ,function(x){min(x)})) #promedio de minimos por columna
  tabFeat[k,11] <-sd(apply(M, 2 ,function(x){min(x)})) #sd de los minimos de columnas
  tabFeat[k,12] <-sd(apply(M, 1 ,function(x){min(x)})) #sd de los minimos de filas
  
  tabFeat[k,13] <- sum(diag(M)) #Suma elementos diagonal
  tabFeat[k,14] <- mean(diag(M)) # media elementos de la diagonal
  tabFeat[k,15] <- sd(diag(M)) # desvio de elementos de la diagonal
  
  tabFeat[k,16] <- sum(M[,ncol(M)/2]) # Suma de linea media vertical
  tabFeat[k,17] <- mean(M[,ncol(M)/2])  # media de linea media vertical
  tabFeat[k,18] <- mean(M[,ncol(M)/2])  # desvio de linea media vertical
  
  tabFeat[k,19] <- sum(M[nrow(M)/2,]) # Suma de linea media horizontal
  tabFeat[k,20] <- mean(M[nrow(M)/2,])  # media de linea media horizontal
  tabFeat[k,21] <- sd(M[nrow(M)/2,])  # desvio de linea media horizontal
  #mitad izquierda
  tabFeat[k,22] <- sum(M[,1:(ncol(M)/2)]) # Suma primer mitad izquierda
  tabFeat[k,23] <- mean(M[,1:(ncol(M)/2)])  # media primer mitad izquierda
  tabFeat[k,24] <- sd(M[,1:(ncol(M)/2)])  # desvio primer mitad izquierda
  #mitad derecha
  tabFeat[k,25] <- sum(M[,(((ncol(M)/2)+1):ncol(M))]) # Suma primer mitad derecha
  tabFeat[k,26] <- mean(M[,(((ncol(M)/2)+1):ncol(M))])  # media primer mitad derecha
  tabFeat[k,27] <- sd(M[,(((ncol(M)/2)+1):ncol(M))])  # desvio primer mitad derecha
  #mitad superior
  tabFeat[k,28] <- sum(M[1:(nrow(M)/2),]) # Suma primer mitad arriba
  tabFeat[k,29] <- mean(M[1:(nrow(M)/2),])   # media primer mitad arriba
  tabFeat[k,30] <- sd(M[1:(nrow(M)/2),])   # desvio primer mitad arriba
  ##Mitad inferior de la matriz
  tabFeat[k,31] <- sum(M[(((nrow(M)/2)+1):nrow(M)),]) # Suma primer mitad abajo
  tabFeat[k,32] <- mean(M[(((nrow(M)/2)+1):nrow(M)),])  # media primer mitad abajo
  tabFeat[k,33] <- sd(M[(((nrow(M)/2)+1):nrow(M)),])   # desvio primer mitad abajo
  
  #cuarto superior izquierdo
  tabFeat[k,34] <- sum(M[1:(nrow(M)/2),1:(ncol(M)/2)]) # Suma porcion cuarto superior izquierda
  tabFeat[k,35] <- mean(M[1:(nrow(M)/2),1:(ncol(M)/2)]) # media porcion cuarto superior izquierda
  tabFeat[k,36] <- sd(M[1:(nrow(M)/2),1:(ncol(M)/2)]) # desvio porcion cuarto superior izquierda
  
  #cuarto superior derecho
  tabFeat[k,37] <- sum(M[1:(nrow(M)/2),(((ncol(M)/2)+1):ncol(M))]) # Suma porcion cuarto superior derecho
  tabFeat[k,38] <- mean(M[1:(nrow(M)/2),(((ncol(M)/2)+1):ncol(M))])# media porcion cuarto superior derecho
  tabFeat[k,39] <- sd(M[1:(nrow(M)/2),(((ncol(M)/2)+1):ncol(M))]) # desvio porcion cuarto superior derecho
  
  #cuarto inferior izquierdo
  tabFeat[k,40] <- sum(M[(((nrow(M)/2)+1):nrow(M)),1:(ncol(M)/2)]) # Suma porcion cuarto inferior izquierda
  tabFeat[k,41] <- mean(M[(((nrow(M)/2)+1):nrow(M)),1:(ncol(M)/2)]) # media porcion cuarto inferior izquierda
  tabFeat[k,42] <- sd(M[(((nrow(M)/2)+1):nrow(M)),1:(ncol(M)/2)]) # desvio porcion cuarto inferior izquierda
  
  #cuarto inferior izquierdo
  tabFeat[k,43] <- sum(M[(((nrow(M)/2)+1):nrow(M)),(((ncol(M)/2)+1):ncol(M))]) # Suma porcion cuarto inferior derecha
  tabFeat[k,44] <- mean(M[(((nrow(M)/2)+1):nrow(M)),(((ncol(M)/2)+1):ncol(M))]) # media porcion cuarto inferior derecha
  tabFeat[k,45] <- sd(M[(((nrow(M)/2)+1):nrow(M)),(((ncol(M)/2)+1):ncol(M))]) # desvio porcion cuarto inferior derecha
  
  ##### PCA
  pcx <-scale(M,center=TRUE,scale=FALSE) %*% svd(scale(M,center=TRUE,scale=FALSE), nu=0, nv=10)$v 
  pcx<-pcx[,1:8] #componentes con mayor porcentaje de variacion

  tabFeat[k,46]<-sum(pcx[,1])*1e15
  tabFeat[k,47]<-sum(pcx[,2])*1e15
  tabFeat[k,48]<-sum(pcx[,3])*1e15
  tabFeat[k,49]<-sum(pcx[,4])*1e15
  tabFeat[k,50]<-sum(pcx[,5])*1e15
  tabFeat[k,51]<-sum(pcx[,6])*1e15
  
  tabFeat[k,52]<-median(pcx[,1])*1e15
  tabFeat[k,53]<-median(pcx[,2])*1e15
  tabFeat[k,54]<-median(pcx[,3])*1e15
  tabFeat[k,55]<-median(pcx[,4])*1e15
  tabFeat[k,56]<-median(pcx[,5])*1e15
  tabFeat[k,57]<-median(pcx[,6])*1e15
  
  tabFeat[k,58]<-sd(pcx[,1])*1e15
  tabFeat[k,59]<-sd(pcx[,2])*1e15
  tabFeat[k,60]<-sd(pcx[,3])*1e15
  tabFeat[k,61]<-sd(pcx[,4])*1e15
  tabFeat[k,62]<-sd(pcx[,5])*1e15
  tabFeat[k,63]<-sd(pcx[,6])*1e15

  tabFeat[k,64] <- tab[i]; # clase
  
  k<-k+1
}

tabFeat_ns <- format(tabFeat[,c(2:64)], scientific=FALSE)
write.csv(tabFeat_ns, file="train_miguel.tuples", quote=FALSE)