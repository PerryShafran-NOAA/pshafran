#PBS -N putmetcam
#PBS -j oe
#PBS -o /lfs/h2/emc/ptmp/perry.shafran/putmet/putmet.out
#PBS -e /lfs/h2/emc/ptmp/perry.shafran/putmet/putmet_nam.out
#PBS -q "dev_transfer"
#PBS -A VERF-DEV
#PBS -S /bin/bash
#PBS -l select=1:ncpus=1:mem=8000MB
#PBS -l walltime=04:00:00
#PBS -l debug=true
                                                                                      
set -x

module purge
module load envvar/1.0
module load PrgEnv-intel/8.1.0
module load intel/19.1.3.304
module load craype/2.7.13
module load cray-mpich/8.1.7
module load prod_util/2.0.10
module load prod_envir/2.0.6

module list

STARTDATE=2023010100
ENDDATE=2023090100
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

cd /lfs/h2/emc/vpppg/noscrub/perry.shafran/metplus_cam/cam/stat/

#for mod in nam gfs conusfv3 conusnest conusarw conusarw2 akarw akarw2 akfv3  rap rapak hrrr hrrrak hawaiinest priconest namna prarw prarw2 prfv3 hiarw hiarw2 hifv3 fv3lamdax fv3lamdaxak fv3lamdaxpr fv3lamdaxhi rrfs_a rrfs_a_conus rrfs_a_naconus rrfs_a_ak rrfs_a_pr rrfs_a_hi

for mod in nam gfs conusfv3 conusnest conusarw conusarw2 akarw akarw2 akfv3  rap rapak hrrr hrrrak hawaiinest priconest namna prarw prarw2 prfv3 hiarw hiarw2 hifv3 fv3lamdax fv3lamdaxak fv3lamdaxpr fv3lamdaxhi rrfs_a

#for mod in hrrr


#for mod in nam
do

tar -cvf ${mod}_${DAY}.met.tar ${mod}/*${DAY}*.stat
hsi put /NCEPDEV/emc-meso/Permanent/Perry.Shafran/verif/metplus/${mod}_${DAY}.met.tar
#htar -cvf /NCEPDEV/emc-meso/Permanent/Perry.Shafran/verif/metplus/${mod}_${DAY}.met.tar tar ${mod}/*${DAY}*.stat
rm -f ${mod}_${DAY}.met.tar

done

DATE=`/apps/ops/prod/nco/core/prod_util.v2.0.14/exec/ndate +24 $DATE`

done
exit
