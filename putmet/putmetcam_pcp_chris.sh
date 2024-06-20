#!/bin/ksh
                                                                                      
set -x


STARTDATE=2021060900
ENDDATE=2022052300
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

cd /gpfs/dell2/emc/verification/noscrub/Christopher.Macintosh/metplus_pcp/grid_stat/

for mod in conusarw conusarw2 conusfv3 conusnest fv3lam fv3lamda fv3lamx gfs hrrr nam rap hrefavrg hreflpmm hrefmean hrefpmmn

do

cd /gpfs/dell2/emc/verification/noscrub/Christopher.Macintosh/metplus_pcp/grid_stat/

tar -cvf /gpfs/dell2/ptmp/Perry.Shafran/chris/metplus_pcp/${mod}_${DAY}.met_pcp.tar ${mod}/*${DAY}*.stat
cd /gpfs/dell2/ptmp/Perry.Shafran/chris/metplus_pcp
hsi put /NCEPDEV/emc-meso/Permanent/Perry.Shafran/verif/metplus_pcp_chris/${mod}_${DAY}.met_pcp.tar
rm -f /gpfs/dell2/ptmp/Perry.Shafran/chris/metplus_pcp/${mod}_${DAY}.met_pcp.tar 

done

DATE=`/gpfs/dell1/nco/ops/nwprod/prod_util.v1.1.2/exec/ips/ndate +24 $DATE`

done
exit
