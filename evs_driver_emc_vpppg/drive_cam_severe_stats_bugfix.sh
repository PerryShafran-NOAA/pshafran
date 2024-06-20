#!/bin/bash
# Author: L.C. Dawson
#
###########################################################
# Called on a cron to run EVS jobs                        #
###########################################################

set -x

now=`date -u +%Y%m%d%H`
vhr=`echo $now | cut -c 9-10`

mkdir -p /lfs/h2/emc/ptmp/${USER}/output_bugfix
cd /lfs/h2/emc/ptmp/${USER}/output_bugfix

module reset

HOMEevs=/lfs/h2/emc/vpppg/noscrub/${USER}/EVS_bugfix

models="hireswarw hireswarwmem2 hireswfv3 href hrrr namnest"

for model in ${models}; do

   qsub -v vhr=$vhr ${HOMEevs}/dev/drivers/scripts/stats/cam/jevs_cam_${model}_severe_stats.sh

   sleep 60

done

exit

