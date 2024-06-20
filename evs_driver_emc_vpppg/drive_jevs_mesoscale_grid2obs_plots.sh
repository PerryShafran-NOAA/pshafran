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

qsub -v vhr=$vhr ${SCRIPTevs}/plots/mesoscale/jevs_mesoscale_grid2obs_plots.sh
qsub -v vhr=$vhr ${SCRIPTevs}/plots/mesoscale/jevs_mesoscale_headline_plots.sh


exit

