#!/bin/bash
#
###########################################################
# Called on a cron to run EVS jobs                        #
###########################################################

set -x

now=`date -u +%Y%m%d%H`
vhr=`echo $now | cut -c 9-10`

mkdir -p /lfs/h2/emc/ptmp/${USER}/outputz_bugfix
cd /lfs/h2/emc/ptmp/${USER}/output_bugfix

module reset

qsub ${SCRIPTevsbugfix}/plots/global_ens/jevs_global_ens_wave_grid2obs_plots.sh

exit

