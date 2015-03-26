#!/bin/bash

cd /tmp/NBODY_direct_results_LSDev8Grp2/
rm -f *
cd ~2900825/cours/M1S2/HPC/Projet/HPC-Project/Sequentiel
./bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/$1 --tend=10.0 --dt=0.1 --soft=0.01 --sum --save
