#!/bin/bash

./bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/$1 --tend=10.0 --dt=0.1 --soft=0.01 --sum --save
