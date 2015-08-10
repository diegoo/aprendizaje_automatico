#!/bin/bash


## preprocess

# java -cp weka36.jar weka.filters.supervised.attribute.AttributeSelection -S "weka.attributeSelection.Ranker -T -1.7976931348623157E308 -N -1" -E "weka.attributeSelection.PrincipalComponents -R 0.95 -A 5" -b -i train.arff -o train_after_pca.arff -r nuevas_instancias.arff -s nuevas_instancias_after_pca.arff

## save model

# java -classpath weka36.jar weka.classifiers.meta.Bagging -P 100 -S 1 -I 10 \
#      -t train.arff \
#      -d modelo.model \
#      -W weka.classifiers.trees.REPTree -- -M 2 -V 0.001 -N 3 -S 1 -L -1

## run model

# java -classpath weka36.jar weka.filters.supervised.attribute.AddClassification \
#      -serialized modelo.model \
#      -classification \
#      -i nuevas_instancias.arff \
#      -o predicciones.arff \
#      -remove-old-class \
#      -c last
