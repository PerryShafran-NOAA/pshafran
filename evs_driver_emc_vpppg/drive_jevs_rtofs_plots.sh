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

for mod in aviso ghrsst osisaf smap smos
do

qsub ${SCRIPTevs}/plots//rtofs/jevs_rtofs_${mod}_grid2grid_last60days_plots.sh

done

for mod in argo ndbc
do

qsub ${SCRIPTevs}/plots/rtofs/jevs_rtofs_${mod}_grid2obs_last60days_plots.sh

done

qsub ${SCRIPTevs}/plots/rtofs/jevs_rtofs_headline_grid2grid_last90days_plots.sh

exit

