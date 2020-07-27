Bootstrap: docker
From: continuumio/miniconda3


%help
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
This file is a singularity definition file to create simg with conda
It starts with a docker image of miniconda continuumio/miniconda3
It allows direct creation of the env by specifying which package with a .yml file with the yml2sing.sh script
https://github.com/kirsho/yml2sing/blob/master/yml2sing.sh
based on documentation https://singularity.lbl.gov/docs-recipes

%labels
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Set labels
    	Maintainer olivier.kirsh@u-paris.fr					
    	Version v1.3 20200727

%files
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Copy files for building		
	Singularity /setupfile/Singularity
	env-name.yml /setupfile/parentyml/env-name.yml
	
%post
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   	
# Set conda channels 
	/opt/conda/bin/conda config --add channels defaults
	/opt/conda/bin/conda config --add channels bioconda
	/opt/conda/bin/conda config --add channels conda-forge

# Update conda
	/opt/conda/bin/conda update -n base conda  			## Optionnal. Or specify version

# Create conda env
	cd /setupfile/parentyml
	defile="$(ls *.y*ml)"
    	/opt/conda/bin/conda env create -n ${defile%%.y*ml} -f $defile
	/opt/conda/bin/conda clean --tarballs
	
# Export FAIR Files
	cd /setupfile							
	/opt/conda/bin/conda list -n ${defile%%.y*ml} > ${defile%%.y*ml}_installed_packages.md
	/opt/conda/bin/conda env export --no-build -n ${defile%%.y*ml} > ${defile%%.y*ml}.yaml
	# Original yml file used to create this image is in /setupfile/parentyml/

%environment
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# set Conda env bin in the PATH
	export PATH=/opt/conda/envs/envname/bin:$PATH
	
%runscript
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# This executes commands
	echo "image startup"
    	exec echo "$@"
