#!/bin/bash

make

head -n -1 testscript.js > testscript.aux1
tail -n +3 testscript.aux1 > testscript.aux2
head -n 1 testscript.js > testscript.aux3
cat testscript.aux3 testscript.aux2 > testscript.js

rm testscript.aux1
rm testscript.aux2
rm testscript.aux3


