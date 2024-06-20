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

verif_read=$1

verif_cases="grid2obs precip"

for verif_case in ${verif_cases}; do

      qsub ${SCRIPTevs}/stats/mesoscale/jevs_mesoscale_sref_${verif_case}_stats.sh

done

exit

