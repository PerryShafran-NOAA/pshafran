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

models="argo aviso ghrsst ndbc osisaf smap smos"

for model in ${models}; do

qsub ${SCRIPTevs}/stats/rtofs/jevs_rtofs_${model}_stats.sh

done

exit

