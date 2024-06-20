#!/bin/ksh
                                                                                      
set -x


#STARTDATE=2021060900
#ENDDATE=2022052300
#DATE=$STARTDATE

###cd /ptmp/wx20ps/temp

#while [ $DATE -le $ENDDATE ]; do


for mod in conusarw conusarw2 conusfv3 conusnest fv3lam fv3lamda fv3lamx rap hrrr hrefmean

do

cd /gpfs/dell2/ptmp/Perry.Shafran/chris/metplus_snow

tar -cvf /gpfs/dell2/ptmp/Perry.Shafran/chris/metplus_snow/${mod}.met_snow.tar ${mod}/*stat
hsi put /NCEPDEV/emc-meso/Permanent/Perry.Shafran/verif/metplus_snow_chris/${mod}.met_snow.tar

done

exit
