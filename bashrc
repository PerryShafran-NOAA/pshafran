# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	        . /etc/bashrc
fi

# User specific aliases and functions
# Set path shell variable
PATH=$PATH:./:$HOME/bin:/usr/sbin:/sbin
export PATH

export PS1="\# (`hostname`) \w > "

export GIT_SSH_COMMAND='ssh -i /u/sshKeys/$USER/id_rsa'

export ECFevs=/lfs/h2/emc/vpppg/noscrub/perry.shafran/EVS/ecf/scripts
export SCRIPTevs=/lfs/h2/emc/vpppg/noscrub/perry.shafran/EVS/dev/drivers/scripts

export HPC_OPT=/apps/ops/para/libs
module use /lfs/h2/emc/nceplibs/noscrub/kgerheiser/hpc-stack-met/install/modulefiles
module use /apps/ops/para/libs/modulefiles/compiler/intel/19.1.3.304
module load intel/19.1.3.304
module load gsl
module load met/11.0.2
module load metplus/5.0.1

module load python/3.8.6
module load netcdf/4.7.4

module load prod_envir
module load prod_util
