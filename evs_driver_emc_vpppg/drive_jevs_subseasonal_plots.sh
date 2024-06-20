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

types="temp sea_ice sst pres_lvls"
periods="31days 90days"

for type in ${types}; do
for period in ${periods}; do

qsub ${SCRIPTevs}/plots/subseasonal/jevs_subseasonal_grid2grid_${type}_plots_${period}.sh

done
done

for period in ${periods}; do

qsub ${SCRIPTevs}/plots/subseasonal/jevs_subseasonal_grid2obs_prepbufr_plots_${period}.sh

done

exit

