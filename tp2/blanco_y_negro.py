#!/usr/bin/env python
import csv, sys

# uso:
# ./blanco_y_negro.py train_data/tuples/1000-I.tuple > 1000-I.blanco.y.negro.tuple
#
# resultado 1 bit:
# 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,0,0,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,I

def bn_1bit(x):
    if x >= 128:
        return "1"
    else:
        return "0"

def bn_2bit(x):
    if x >= 0 and x <= 64:
        return "00"
    elif x >= 65 and x <= 128:
        return "01"
    elif x >= 129 and x <= 192:
        return "10"
    else:
        return "11"
    
with open(sys.argv[1], 'r') as image_file:
    r = csv.reader(image_file, delimiter=',')
    for vector in r:
        clase = vector[-1]
        valores = [bn_1bit(int(x)) for x in vector[:-1]]
        print(','.join(valores) + ',' + clase)
