#!/bin/bash
# Author: L.C. Dawson
#
###########################################################
# Called on a cron to run EVS jobs                        #
###########################################################

now=`date -u +%Y%m%d%H`
vhr=`echo $now | cut -c 9-10`

mkdir -p /lfs/h2/emc/ptmp/${USER}/output
cd /lfs/h2/emc/ptmp/${USER}/output

module reset

HOMEevs=/lfs/h2/emc/vpppg/noscrub/${USER}/EVS

models="rrfs"

for model in ${models}; do

   qsub -v cyc=$vhr ${HOMEevs}/dev/drivers/scripts/cam/stats/jevs_cam_${model}_severe_stats.sh

   sleep 60

done

exit

