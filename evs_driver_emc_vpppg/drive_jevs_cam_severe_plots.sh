#!/bin/bash
# Author: L.C. Dawson
#
###########################################################
# Called on a cron to run EVS jobs                        #
###########################################################

now=`date -u +%Y%m%d%H`
vhr=`echo $now | cut -c 9-10`

mkdir -p /lfs/h2/emc/ptmp/${USER}/output
cd /lfs/h2/emc/ptmp/${USER}/output

module reset

HOMEevs=/lfs/h2/emc/vpppg/noscrub/${USER}/EVS

LINE_TYPES="nbrcnt nbrctc pstd"
LINE_TYPES="nbrcnt nbrctc"
EVAL_PERIODS="LAST31DAYS LAST90DAYS"

for x in ${LINE_TYPES}; do
for y in ${EVAL_PERIODS}; do

   echo "submitting jevs_cam_severe_plots.sh for ${x} linetype over ${y} at $now"
   qsub -v LINE_TYPE=$x,EVAL_PERIOD=$y ${HOMEevs}/dev/drivers/scripts/plots/cam/jevs_cam_severe_plots.sh
   sleep 5

done
done

exit

