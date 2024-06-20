#!/bin/bash
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

qsub ${SCRIPTevs}/analyses/plots/jevs_analyses_plots.sh

exit

