#!/bin/bash
#
###########################################################
# Called on a cron to run EVS jobs                        #
###########################################################

set -x

now=`date -u +%Y%m%d%H`
vhr=`echo $now | cut -c 9-10`

mkdir -p /lfs/h2/emc/ptmp/${USER}/output_bugfix
cd /lfs/h2/emc/ptmp/${USER}/output_bugfix

module reset

qsub ${SCRIPTevsbugfix}/stats/global_det/jevs_global_det_wave_gfs_grid2obs_stats.sh

exit

