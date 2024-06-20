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

models="nam rap"

for model in ${models}; do

qsub -v vhr=$vhr ${SCRIPTevs}/stats/mesoscale/jevs_mesoscale_${model}_snowfall_stats.sh

done

exit

