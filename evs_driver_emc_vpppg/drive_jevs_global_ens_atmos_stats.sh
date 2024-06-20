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

verif_cases="grid2grid grid2obs precip snowfall sst sea_ice cnv"

for verif_case in ${verif_cases}; do

   if [ $verif_case = snowfall ]; then
      models="gefs cmce ecme"
   elif [ $verif_case = sst -o $verif_case = sea_ice -o $verif_case = cnv ]; then
      models="gefs"
   elif [ $verif_case = grid2grid -o $verif_case = grid2obs -o $verif_case = precip ]; then
      models="gefs cmce ecme naefs"
   fi

   for model in ${models}; do
      qsub ${SCRIPTevs}/stats/global_ens/jevs_global_ens_${model}_atmos_${verif_case}_stats.sh
   done
 
done

exit

