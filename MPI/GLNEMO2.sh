#!/bin/bash

FILE="results_$1_"
PWD=`pwd`

cd /tmp/NBODY_direct_results_LSDev8Grp2/
rm -f list
for i in 0 1 2 3 4 5 6 7 8 9
do
    mv $FILE$i".nemo" $FILE"0"$i".nemo"
done
ls -l |cut -d' ' -f10 > list
NB=`cat list |wc -l`
((nb = $NB - 2))
tail -n $nb list > list2
rm -f list
mv list2 list
cd ~fortin/Public/HPC_fev2015/Projet/NEMO/nemo_cvs/bin/
./glnemo2 /tmp/NBODY_direct_results_LSDev8Grp2/list
cd $PWD
