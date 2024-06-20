#!/bin/bash
#
###########################################################
# Called on a cron to run EVS jobs                        #
###########################################################

set -x

now=`date -u +%Y%m%d%H`
vhr=`echo $now | cut -c 9-10`

mkdir -p /lfs/h2/emc/ptmp/${USER}/output
cd /lfs/h2/emc/ptmp/${USER}/output

module reset

model=$1
verif_case=$2

qsub ${SCRIPTevs}/stats/global_det/jevs_global_det_atmos_${model}_${verif_case}_stats.sh

exit

