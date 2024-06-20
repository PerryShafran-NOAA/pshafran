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

periods="past31days past90days"

for period in ${periods}; do

      qsub ${SCRIPTevs}/plots/narre/jevs_narre_${period}_plots.sh

done

exit

