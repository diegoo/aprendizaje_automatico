#!/bin/bash

FILES=output/*.csv

for IF in $FILES
do
  OF=`basename $IF`
  java -cp weka.jar weka.core.converters.CSVLoader $IF > arff/$OF.arff
done
