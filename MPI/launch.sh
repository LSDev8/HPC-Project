#!/bin/bash
#launch.sh

mkdir logs

## 16 PROCS ##
mpirun --hostfile hostfile/hostfile-301-16 -n 16 ./bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/baredisk_8192-plummer_8192.nemo --tend=10.0 --dt=0.1 --soft=0.01  > logs/plumer8192bare8192_16proc_16machine
mpirun --hostfile hostfile/hostfile-301-08 -n 16 ./bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/baredisk_8192-plummer_8192.nemo --tend=10.0 --dt=0.1 --soft=0.01  > logs/plumer8192bare8192_16proc_8machine

## 08 PROCS ##
mpirun --hostfile hostfile/hostfile-301-08 -n 8 ./bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/baredisk_8192-plummer_8192.nemo --tend=10.0 --dt=0.1 --soft=0.01  > logs/plumer8192bare8192_8proc_8machine
mpirun --hostfile hostfile/hostfile-301-04 -n 8 ./bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/baredisk_8192-plummer_8192.nemo --tend=10.0 --dt=0.1 --soft=0.01  > logs/plumer8192bare8192_8proc_4machine

## 04 PROCS ##
mpirun --hostfile hostfile/hostfile-301-04 -n 4 ./bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/baredisk_8192-plummer_8192.nemo --tend=10.0 --dt=0.1 --soft=0.01  > logs/plumer8192bare8192_4proc_4machine
mpirun --hostfile hostfile/hostfile-301-02 -n 4 ./bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/baredisk_8192-plummer_8192.nemo --tend=10.0 --dt=0.1 --soft=0.01  > logs/plumer8192bare8192_4proc_2machine

## 02 PROCS ##
mpirun --hostfile hostfile/hostfile-301-02 -n 2 ./bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/baredisk_8192-plummer_8192.nemo --tend=10.0 --dt=0.1 --soft=0.01  > logs/plumer8192bare8192_2proc_2machine
