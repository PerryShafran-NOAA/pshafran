#!/bin/ksh
                                                                                      
set -x


STARTDATE=2021080900
ENDDATE=2021120500
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

cd /gpfs/dell2/emc/verification/noscrub/Perry.Shafran/metplus_pcp/grid_stat/

for mod in conusarw conusarw2 conusfv3 conusnest fv3lam fv3lamda fv3lamx gfs hrrr nam rap

do

tar -cvf ${mod}_${DAY}.met_pcp.tar ${mod}/*${DAY}*.stat
hsi put /NCEPDEV/emc-meso/Permanent/Perry.Shafran/verif/metplus_pcp/${mod}_${DAY}.met_pcp.tar
rm -f ${mod}_${DAY}.met.tar

done

DATE=`/gpfs/dell1/nco/ops/nwprod/prod_util.v1.1.2/exec/ips/ndate +24 $DATE`

done
exit
