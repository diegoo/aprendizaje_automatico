#!/usr/bin/env python
import csv, sys

# uso:
# ./blanco_y_negro.py train_data/tuples/1000-I.tuple > 1000-I.blanco.y.negro.tuple
#
# resultado 1 bit:
# 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,0,0,0,1,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,0,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,I

arff_header = """
@relation test

@attribute 1 numeric
@attribute 2 numeric
@attribute 3 numeric
@attribute 4 numeric
@attribute 5 numeric
@attribute 6 numeric
@attribute 7 numeric
@attribute 8 numeric
@attribute 9 numeric
@attribute 10 numeric
@attribute 11 numeric
@attribute 12 numeric
@attribute 13 numeric
@attribute 14 numeric
@attribute 15 numeric
@attribute 16 numeric
@attribute 17 numeric
@attribute 18 numeric
@attribute 19 numeric
@attribute 20 numeric
@attribute 21 numeric
@attribute 22 numeric
@attribute 23 numeric
@attribute 24 numeric
@attribute 25 numeric
@attribute 26 numeric
@attribute 27 numeric
@attribute 28 numeric
@attribute 29 numeric
@attribute 30 numeric
@attribute 31 numeric
@attribute 32 numeric
@attribute 33 numeric
@attribute 34 numeric
@attribute 35 numeric
@attribute 36 numeric
@attribute 37 numeric
@attribute 38 numeric
@attribute 39 numeric
@attribute 40 numeric
@attribute 41 numeric
@attribute 42 numeric
@attribute 43 numeric
@attribute 44 numeric
@attribute 45 numeric
@attribute 46 numeric
@attribute 47 numeric
@attribute 48 numeric
@attribute 49 numeric
@attribute 50 numeric
@attribute 51 numeric
@attribute 52 numeric
@attribute 53 numeric
@attribute 54 numeric
@attribute 55 numeric
@attribute 56 numeric
@attribute 57 numeric
@attribute 58 numeric
@attribute 59 numeric
@attribute 60 numeric
@attribute 61 numeric
@attribute 62 numeric
@attribute 63 numeric
@attribute 64 numeric
@attribute 65 numeric
@attribute 66 numeric
@attribute 67 numeric
@attribute 68 numeric
@attribute 69 numeric
@attribute 70 numeric
@attribute 71 numeric
@attribute 72 numeric
@attribute 73 numeric
@attribute 74 numeric
@attribute 75 numeric
@attribute 76 numeric
@attribute 77 numeric
@attribute 78 numeric
@attribute 79 numeric
@attribute 80 numeric
@attribute 81 numeric
@attribute 82 numeric
@attribute 83 numeric
@attribute 84 numeric
@attribute 85 numeric
@attribute 86 numeric
@attribute 87 numeric
@attribute 88 numeric
@attribute 89 numeric
@attribute 90 numeric
@attribute 91 numeric
@attribute 92 numeric
@attribute 93 numeric
@attribute 94 numeric
@attribute 95 numeric
@attribute 96 numeric
@attribute 97 numeric
@attribute 98 numeric
@attribute 99 numeric
@attribute 100 numeric
@attribute 101 numeric
@attribute 102 numeric
@attribute 103 numeric
@attribute 104 numeric
@attribute 105 numeric
@attribute 106 numeric
@attribute 107 numeric
@attribute 108 numeric
@attribute 109 numeric
@attribute 110 numeric
@attribute 111 numeric
@attribute 112 numeric
@attribute 113 numeric
@attribute 114 numeric
@attribute 115 numeric
@attribute 116 numeric
@attribute 117 numeric
@attribute 118 numeric
@attribute 119 numeric
@attribute 120 numeric
@attribute 121 numeric
@attribute 122 numeric
@attribute 123 numeric
@attribute 124 numeric
@attribute 125 numeric
@attribute 126 numeric
@attribute 127 numeric
@attribute 128 numeric
@attribute 129 numeric
@attribute 130 numeric
@attribute 131 numeric
@attribute 132 numeric
@attribute 133 numeric
@attribute 134 numeric
@attribute 135 numeric
@attribute 136 numeric
@attribute 137 numeric
@attribute 138 numeric
@attribute 139 numeric
@attribute 140 numeric
@attribute 141 numeric
@attribute 142 numeric
@attribute 143 numeric
@attribute 144 numeric
@attribute 145 numeric
@attribute 146 numeric
@attribute 147 numeric
@attribute 148 numeric
@attribute 149 numeric
@attribute 150 numeric
@attribute 151 numeric
@attribute 152 numeric
@attribute 153 numeric
@attribute 154 numeric
@attribute 155 numeric
@attribute 156 numeric
@attribute 157 numeric
@attribute 158 numeric
@attribute 159 numeric
@attribute 160 numeric
@attribute 161 numeric
@attribute 162 numeric
@attribute 163 numeric
@attribute 164 numeric
@attribute 165 numeric
@attribute 166 numeric
@attribute 167 numeric
@attribute 168 numeric
@attribute 169 numeric
@attribute 170 numeric
@attribute 171 numeric
@attribute 172 numeric
@attribute 173 numeric
@attribute 174 numeric
@attribute 175 numeric
@attribute 176 numeric
@attribute 177 numeric
@attribute 178 numeric
@attribute 179 numeric
@attribute 180 numeric
@attribute 181 numeric
@attribute 182 numeric
@attribute 183 numeric
@attribute 184 numeric
@attribute 185 numeric
@attribute 186 numeric
@attribute 187 numeric
@attribute 188 numeric
@attribute 189 numeric
@attribute 190 numeric
@attribute 191 numeric
@attribute 192 numeric
@attribute 193 numeric
@attribute 194 numeric
@attribute 195 numeric
@attribute 196 numeric
@attribute 197 numeric
@attribute 198 numeric
@attribute 199 numeric
@attribute 200 numeric
@attribute 201 numeric
@attribute 202 numeric
@attribute 203 numeric
@attribute 204 numeric
@attribute 205 numeric
@attribute 206 numeric
@attribute 207 numeric
@attribute 208 numeric
@attribute 209 numeric
@attribute 210 numeric
@attribute 211 numeric
@attribute 212 numeric
@attribute 213 numeric
@attribute 214 numeric
@attribute 215 numeric
@attribute 216 numeric
@attribute 217 numeric
@attribute 218 numeric
@attribute 219 numeric
@attribute 220 numeric
@attribute 221 numeric
@attribute 222 numeric
@attribute 223 numeric
@attribute 224 numeric
@attribute 225 numeric
@attribute 226 numeric
@attribute 227 numeric
@attribute 228 numeric
@attribute 229 numeric
@attribute 230 numeric
@attribute 231 numeric
@attribute 232 numeric
@attribute 233 numeric
@attribute 234 numeric
@attribute 235 numeric
@attribute 236 numeric
@attribute 237 numeric
@attribute 238 numeric
@attribute 239 numeric
@attribute 240 numeric
@attribute 241 numeric
@attribute 242 numeric
@attribute 243 numeric
@attribute 244 numeric
@attribute 245 numeric
@attribute 246 numeric
@attribute 247 numeric
@attribute 248 numeric
@attribute 249 numeric
@attribute 250 numeric
@attribute 251 numeric
@attribute 252 numeric
@attribute 253 numeric
@attribute 254 numeric
@attribute 255 numeric
@attribute 256 numeric
@attribute clase {B,C,F,H,I,K}

@data

"""

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

if __name__ == '__main__':
    print arff_header

    with open(sys.argv[1], 'r') as image_file:
        r = csv.reader(image_file, delimiter=',')
        for vector in r:
            clase = vector[-1]
            valores = [bn_1bit(int(x)) for x in vector[:-1]]
            print(','.join(valores) + ',' + clase)

