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

MONTH=202303

cd /lfs/h2/emc/vpppg/noscrub/perry.shafran/metplus_cam/stat/

for mod in akarw   aknest     conusfv3   fv3lamdax    fv3lamdaxna  hawaiinest  hifv3   nam     prfv3      rapak      rrfs_a_conus    rrfs_a_pr akarw2  conusarw   conusnest  fv3lamdaxak  fv3lamdaxpr  hiarw       hrrr    prarw   priconest  rrfs_a     rrfs_a_hi akfv3   conusarw2   fv3lamdaxhi  gfs          hiarw2      hrrrak  prarw2  rap        rrfs_a_ak  rrfs_a_naconus
do

tar -cvf ${mod}_${MONTH}.met.tar ${mod}/*${MONTH}*.stat
hsi put /NCEPDEV/emc-meso/Permanent/Perry.Shafran/verif/cam_rrfs/cactus/${mod}_${MONTH}.met.tar
rm -f ${mod}_${MONTH}.met.tar

done

exit
