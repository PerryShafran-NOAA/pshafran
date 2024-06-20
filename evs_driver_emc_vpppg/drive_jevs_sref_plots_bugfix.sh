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

verif_cases="grid2obs precip cnv cape cloud td2m"

for verif_case in ${verif_cases}; do

      qsub ${SCRIPTevs_bugfix}/plots/mesoscale/jevs_mesoscale_sref_${verif_case}_past90days_plots.sh

done

qsub ${SCRIPTevs_bugfix}/plots/mesoscale/jevs_mesoscale_sref_precip_spatial_plots.sh

exit

