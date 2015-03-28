#! /bin/bash

FILE=cube_64.nemo
PATHPROJET=~/cours/M1S2/HPC/Projet/HPC-Project/MPI/V2/
NBPROC=4

mkdir -p logs

## 16 PROCS ##
echo "## 16 proc -> 16 machines ##"
#mpirun --hostfile hostfile/hostfile-301-16 -n 16 ./bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/baredisk_8192-plummer_8192.nemo --tend=10.0 --dt=0.1 --soft=0.01  > logs/plumer8192bare8192_16proc_16machine
echo "## 04 proc ##"
mpirun -n 4 ./bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/${FILE} --tend=6.0 --dt=0.1 --soft=0.01 --sum --save > logs/results_par.log

tseq=`tail -n 5 logs/results_seq.log | head -n 1 | cut -f4 -d' '`
tpar=`tail -n 5 logs/results_par.log | head -n 1 | cut -f4 -d' '`

eff=`echo "(($tseq / $tpar) / $NBPROC)" | bc -l`

echo -e "t_seq\t\tt_par\t\tefficacite"
echo -e "${tseq}\t${tpar}\t${eff}"
