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

verif_cases="grid2obs"

for verif_case in ${verif_cases}; do

      qsub ${SCRIPTevsbugfix}/stats/cam/jevs_cam_href_${verif_case}_stats.sh

done

exit

