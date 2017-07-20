#!/bin/ksh
#
# LSF batch script to run the test MPI code
#
#BSUB -P UDKE0009                       # project number
#BSUB -u yu.zhang4@duke.edu              # email address
#BSUB -a poe                            # select poe
#BSUB -n 8                              # number of total (MPI) tasks
#BSUB -R "span[ptile=16]"               # run a max of 32 tasks per node
#BSUB -J Alligator_NoahMP                            # job name
#BSUB -o Alligator_NoahMP%J.out                      # output filename
#BSUB -e Alligator_NoahMP%J.err                      # error filename
#BSUB -W 24:00                           # wallclock time
#BSUB -q geyser                         # queue
#BSUB -N

#source /usr/local/lsf/conf/cshrc.lsf

cd /glade/p/work/yuzhang/simulations/Alligator/new_inputs_20161103/Run3/
export MP_EAGER_LIMIT=0                 # for communication time
export TARGET_CPU_LIST="-1"             # processor binding
mpirun.lsf ./wrf_hydro_NoahMP.exe
exit
