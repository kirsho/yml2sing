Bootstrap: docker
From: continuumio/miniconda3

%labels
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Set labels
    Maintainer olivier.kirsh@u-paris.fr					
    Version v1.2 20200724

%files
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# load the definition files

# If .yml
    	env-name.yml	## change .yml name

#	Singularity	# definition file


%post
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    	
	echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc
	/opt/conda/bin/conda config --add channels defaults
	/opt/conda/bin/conda config --add channels bioconda
	/opt/conda/bin/conda config --add channels conda-forge


# If .yml
	defile="$(ls *.yml)"
   	echo "source activate ${defile%%.yml}" > ~/.bashrc
    	/opt/conda/bin/conda env create -n ${defile%%.yml} -f $defile
	/opt/conda/bin/conda clean --tarballs
#	mkdir -p /home/setupfile
#	cp $defile Singularity /home/setupfile
#	cd /home/setupfile
#	/opt/conda/bin/conda list -n ${defile%%.yml} > ${defile%%.yml}_installed_packages.md


%environment
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# set Conda in the PATH
	echo "conda activate"
	defile="$(ls *.y*ml)"
	export PATH=/opt/conda/envs/${defile%%.yml}/bin:$PATH						## Set environment name

	
	
%runscript
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# This executes commands
	echo "image startup"
    	exec echo "$@"
