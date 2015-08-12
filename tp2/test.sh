#!/bin/bash

# uso:
# ./test.sh best_model.model input.arff

MODELO=$1
NUEVAS_INSTANCIAS=$2
NUEVAS_INSTANCIAS_CLASIFICADAS="${NUEVAS_INSTANCIAS%%.*}_output.arff"

echo "clasificando $NUEVAS_INSTANCIAS ..."

java -classpath weka36.jar weka.filters.supervised.attribute.AddClassification -serialized $MODELO -classification -remove-old-class -i $NUEVAS_INSTANCIAS -o $NUEVAS_INSTANCIAS_CLASIFICADAS -c last

echo "... resultados en $NUEVAS_INSTANCIAS_CLASIFICADAS"
