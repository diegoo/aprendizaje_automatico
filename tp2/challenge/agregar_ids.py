#!/usr/bin/env python
import csv, sys

# uso:
# ./agregar_ids.py output.arff > grupoNN.txt

if __name__ == '__main__':
    with open(sys.argv[1], 'r') as classification_file:
        lines = [line for line in classification_file.readlines() if not line.startswith('@') and not line == '\n']
        for (i, line) in enumerate(lines, 10001):
            print("%d,%s" % (i, line))
