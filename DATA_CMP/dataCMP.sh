#! /bin/bash                                                                                                                                                                                                      

FILE=$1
PATHPROJET=~/cours/M1S2/HPC/Projet/HPC-Project/
NBPROC=$2

mkdir -p logs

echo ""
echo "======================= ${NBPROC} ======================="
echo "" >> data_cmp.txt
echo "======================= ${NBPROC} =======================" >> data_cmp.txt
for i in 64 128 256 512 1024 2048 4096
do
    echo "## SEQUENTIEL ##"
    ../Sequentiel/bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/${FILE}_$i.nemo --tend=6.0 --dt=0.1 --soft=0.01 --sum --save > logs/results_seq.log
    echo "## 04 proc -> 04 machines ##"
    mpirun -n ${NBPROC} ../MPI/V2/bin/NBODY_direct --in=/users/Enseignants/fortin/Public/HPC_fev2015/Projet/data/${FILE}_$i.nemo --tend=6.0 --dt=0.1 --soft=0.01 --sum --save > logs/results_par.log

    tseq=`tail -n 5 logs/results_seq.log | head -n 1 | cut -f4 -d' '`
    tpar=`tail -n 5 logs/results_par.log | head -n 1 | cut -f4 -d' '`

    eff=`echo "((($tseq / $tpar) / $NBPROC)*100)" | bc -l`

    echo -e "t_seq\t\tt_par\t\tefficacite"
    echo -e "${tseq}\t${tpar}\t${eff}"

    echo "## ${FILE}_$i.nemo ##" >> data_cmp.txt
    echo -e "t_seq\t\tt_par\t\tefficacite" >> data_cmp.txt
    echo -e "${tseq}\t${tpar}\t${eff}" >> data_cmp.txt
done

rm -rf logs
