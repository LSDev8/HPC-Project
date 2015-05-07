#!/bin/bash

for i in 8 4 2
do
    cat hostfile-301-16 | head -n $i > hostfile-301-0$i
    cat hostfile-303-16 | head -n $i > hostfile-303-0$i
    cat hostfile-308-16 | head -n $i > hostfile-308-0$i
done
