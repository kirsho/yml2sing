Bootstrap: docker
From: continuumio/miniconda3


%help

This file is a singularity definition file to create simg with conda
It starts with a docker image of miniconda continuumio/miniconda3
It allows direct creation of the env by specifying which package with a .yml file with the yml2sing.sh script
based on documentation https://singularity.lbl.gov/docs-recipes

%labels
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Set labels
    Maintainer olivier.kirsh@u-paris.fr					
    Version v1.2 20200728


%setup
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

mkdir -p ${SINGULARITY_ROOTFS}/setupfile
defile="$(ls *.y*ml)"

%files
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Singularity /setupfile/Singularity

env-name.yml /setupfile/env-name.yml


%post
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    	
# Edit .bashrc to run conda    	
	echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc		## Enable conda for the current user
									## Better than $ echo "conda activate" >> ~/.bashrc
									## or $ export PATH="/opt/miniconda3/bin:$PATH" (not recommanded)

# Set conda channels 
	/opt/conda/bin/conda config --add channels defaults
	/opt/conda/bin/conda config --add channels bioconda
	/opt/conda/bin/conda config --add channels conda-forge


# Update conda
	/opt/conda/bin/conda update -n base conda  			## Optionnal. Or specify version


# If .yml
	defile="$(ls *.y*ml)"
    	/opt/conda/bin/conda env create -n ${defile%%.y*ml} -f $defile
	/opt/conda/bin/conda clean --tarballs
	
	cd /setupfile							## FAIR infos
	/opt/conda/bin/conda list -n ${defile%%.yml} > ${defile%%.yml}_installed_packages.md
	/opt/conda/bin/conda env export --no-build -n ${defile%%.yml} > $defile-image.yml


%environment
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# set Conda in the PATH
	echo "conda activate"
#	defile="$(ls *.y*ml)"
	export PATH=/opt/conda/envs/${defile%%.yml}/bin:$PATH						## Set environment name

	
	
%runscript
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# This executes commands
	echo "image startup"
    	exec echo "$@"
