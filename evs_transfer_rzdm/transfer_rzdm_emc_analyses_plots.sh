#PBS -N transfer_rzdm_emc_analyses_plots
#PBS -o /lfs/h2/emc/ptmp/perry.shafran/output/transfer_rzdm_emc_analyses_plots.out
#PBS -e /lfs/h2/emc/ptmp/perry.shafran/output/transfer_rzdm_emc_analyses_plots.out
#PBS -S /bin/bash
#PBS -q dev_transfer
#PBS -A VERF-DEV
#PBS -l walltime=03:00:00
#PBS -l place=shared,select=1:ncpus=1:mem=25GB
#PBS -l debug=true
#PBS -V

export PDYm1=$(date -d "48 hours ago" '+%Y%m%d')
rsync -ahr -P /lfs/h2/emc/ptmp/emc.vpppg/evs/v1.0/plots/analyses/atmos.${PDYm1}/*.tar wd20ps@emcrzdm.ncep.noaa.gov:/home/people/emc/www/htdocs/users/verification/analyses/para/tar_files/.
