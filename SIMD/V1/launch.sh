#!/bin/bash
#launch.sh

mkdir -p logs

## 16 PROCS ##
echo "## 16 proc -> 16 machines ##"
#mpirun --hostfile hostfile/hostfile-301-16 -n 16 ./bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/baredisk_8192-plummer_8192.nemo --tend=6.0 --dt=0.1 --soft=0.01  > logs/plumer8192bare8192_16proc_16machine
echo "## 16 proc -> 08 machines ##"
mpirun --hostfile hostfile/hostfile-301-08 -n 16 ./bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/$1 --tend=6.0 --dt=0.1 --soft=0.01 --save > logs/$1_16proc_8machine

## 08 PROCS ##
echo "## 08 proc -> 08 machines ##"
mpirun --hostfile hostfile/hostfile-301-08 -n 8 ./bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/$1 --tend=6.0 --dt=0.1 --soft=0.01  > logs/$1_8proc_8machine
echo "## 08 proc -> 04 machines ##"
mpirun --hostfile hostfile/hostfile-301-04 -n 8 ./bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/$1 --tend=6.0 --dt=0.1 --soft=0.01  > logs/$1_8proc_4machine

## 04 PROCS ##
echo "## 04 proc -> 04 machines ##"
mpirun --hostfile hostfile/hostfile-301-04 -n 4 ./bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/$1 --tend=6.0 --dt=0.1 --soft=0.01  > logs/$1_4proc_4machine
echo "## 04 proc -> 02 machines ##"
mpirun --hostfile hostfile/hostfile-301-02 -n 4 ./bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/$1 --tend=6.0 --dt=0.1 --soft=0.01  > logs/$1_4proc_2machine

## 02 PROCS ##
echo "## 02 proc -> 02 machines ##"
mpirun --hostfile hostfile/hostfile-301-02 -n 2 ./bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/$1 --tend=6.0 --dt=0.1 --soft=0.01  > logs/$1_2proc_2machine
