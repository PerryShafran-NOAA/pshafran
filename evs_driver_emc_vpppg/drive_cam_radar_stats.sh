#!/bin/bash
# Author: L.C. Dawson
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

HOMEevs=/lfs/h2/emc/vpppg/noscrub/${USER}/EVS

models="hireswarw hireswarwmem2 hireswfv3 href hrrr namnest"

for model in ${models}; do
   qsub -v vhr=$vhr ${HOMEevs}/dev/drivers/scripts/stats/cam/jevs_cam_${model}_radar_stats.sh
   sleep 30
done


exit

