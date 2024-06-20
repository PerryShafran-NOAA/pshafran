#!/bin/ksh
                                                                                      
set -x


STARTDATE=2020042800
ENDDATE=2022053100
DATE=$STARTDATE

###cd /ptmp/wx20ps/temp

while [ $DATE -le $ENDDATE ]; do

echo $DATE > curdate
DAY=`cut -c 1-8 curdate`
YEAR=`cut -c 1-4 curdate`
MONTH=`cut -c 1-6 curdate`

echo $DATEM1 > curdate2
DAYM1=`cut -c 1-8 curdate2`
YEARM1=`cut -c 1-4 curdate2`
MONTHM1=`cut -c 1-6 curdate2`

cd /gpfs/dell2/emc/verification/noscrub/Perry.Shafran/metplus_aq/aqm/stat/

for mod in aq pm

#for mod in nam
do

tar -cvf ${mod}_${DAY}.met.tar ${mod}/*${DAY}*.stat
hsi put /NCEPDEV/emc-meso/Permanent/Perry.Shafran/verif/metplus_aq/${mod}_${DAY}.met.tar
rm -f ${mod}_${DAY}.met.tar

done

DATE=`/gpfs/dell1/nco/ops/nwprod/prod_util.v1.1.2/exec/ips/ndate +24 $DATE`

done
exit