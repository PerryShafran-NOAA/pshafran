#!/bin/bash
# Author: L.C. Dawson
#
###########################################################
# Called on a cron to run EVS jobs                        #
###########################################################

set -x

now=`date -u +%Y%m%d%H`
vhr=`echo $now | cut -c 9-10`

mkdir -p /lfs/h2/emc/ptmp/${USER}/outputdev
cd /lfs/h2/emc/ptmp/${USER}/outputdev

export SCRIPTevs=/lfs/h2/emc/vpppg/noscrub/${USER}/pr145test/EVS/dev/drivers/scripts

module reset

qsub -v cyc=$vhr ${SCRIPTevs}/analyses/stats/jevs_rtma_stats.sh
qsub -v cyc=$vhr ${SCRIPTevs}/analyses/stats/jevs_urma_stats.sh
qsub -v cyc=$vhr ${SCRIPTevs}/analyses/stats/jevs_rtma_ru_stats.sh

exit

