#!/bin/bash

# This script execute a singularity build command to create a sing image from a yml file
# 
# Usage : create a folder containing a yml file and type un a terminal $ yml2sing.sh <image-name> 
# It will create a singularity image named envname.simg with the tools installed in an conda env named with the basename of the yml.
# read my documentation about singularity 
# https://github.com/kirsho/Singularity/blob/master/Intro2Singularity.md
# https://github.com/kirsho/yml2sing/blob/master/yml2sing.sh
# contact : Olivier Kirsh <olivier.kirsh@u-paris.fr>
# date : 20200727

# folder cleanup
rm Singularity*  && \

# Download definition file
wget https://raw.githubusercontent.com/kirsho/yml2sing/master/Singularity  && \

# extract yml file name (rename it to change 
DEFILE="$(ls *.y*ml)"  && \

# mofify the definition file (Singularity)
sed -i "s/env-name.yml/${DEFILE}/g" Singularity  && \

sed -i "s/envname/${DEFILE%%.y*ml}/g" Singularity  && \

# Build the image
sudo singularity build $1.simg Singularity
