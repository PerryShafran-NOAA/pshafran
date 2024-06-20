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

qsub -v vhr=$vhr ${HOMEevs}/dev/drivers/scripts/prep/cam/jevs_cam_radar_prep.sh

exit

