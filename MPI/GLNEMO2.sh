#!/bin/bash

cd /tmp/NBODY_direct_results_LSDev8Grp2/
ls -lhtr |cut -d' ' -f10 > list
cd ~fortin/Public/HPC_fev2015/Projet/NEMO/nemo_cvs/bin/
./glnemo2 /tmp/NBODY_direct_results_LSDev8Grp2/results_plummer_128.nemo_0.nemo
cd ~
