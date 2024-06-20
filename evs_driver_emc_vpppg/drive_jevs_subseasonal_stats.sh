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

stat_job=$1

#for model in cfs gefs
#do

#for type in grid2obs grid2grid
#do

qsub ${SCRIPTevs}/stats/subseasonal/jevs_subseasonal_${stat_job}_stats.sh

#done
#done

exit

