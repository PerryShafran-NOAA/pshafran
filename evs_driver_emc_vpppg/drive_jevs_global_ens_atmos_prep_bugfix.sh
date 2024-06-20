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

qsub ${SCRIPTevsbugfix}/prep/global_ens/jevs_global_ens_atmos_prep.sh
qsub ${SCRIPTevsbugfix}/prep/global_ens/jevs_global_ens_naefs_atmos_prep.sh

exit

