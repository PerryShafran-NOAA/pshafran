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

qsub -v vhr=$vhr ${SCRIPTevs}/stats/analyses/jevs_analyses_rtma_grid2obs_stats.sh
qsub -v vhr=$vhr ${SCRIPTevs}/stats/analyses/jevs_analyses_urma_grid2obs_stats.sh
qsub -v vhr=$vhr ${SCRIPTevs}/stats/analyses/jevs_analyses_rtma_ru_grid2obs_stats.sh

exit

