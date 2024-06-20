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

for model in gfs gefs naefs
do

qsub ${SCRIPTevs}/stats/global_ens/jevs_global_ens_${model}_headline_grid2grid_stats.sh

done

exit

