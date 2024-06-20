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

verif_read=$1

if [ $verif_read = "nocnv" ]; then
 verif_cases="grid2obs"
elif [ $verif_read = "cnv" ]; then
 verif_cases="cnv"
fi

for verif_case in ${verif_cases}; do

      qsub ${SCRIPTevsbugfix}/stats/mesoscale/jevs_mesoscale_sref_${verif_case}_stats.sh

done

exit

