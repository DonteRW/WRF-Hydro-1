#!/bin/ksh
#BSUB -P UDKE0009                       # project number
#BSUB -u yu.zhang4@duke.edu              # email address
#BSUB -J Alligator                       # job name
#BSUB -q geyser                        # queue
#BSUB -W 24:00                          # wallclock time
#BSUB -n 1                             # number of tasks
#BSUB -R "span[ptile=1]"               # run 16 tasks per node
#BSUB -o Alligator%J.out                # output filename (%J to add job id)
#BSUB -e Alligator%J.err                # error filename

cd /glade/p/work/yuzhang/WRF/WRFV3/hydro/Run/
export MP_EAGER_LIMIT=0                 # for communication time
export TARGET_CPU_LIST="-1"             # processor binding
mpirun.lsf ./wrf_hydro_Noah.exe
