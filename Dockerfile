# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
# See https://github.com/ucsd-ets/datahub-docker-stack/wiki/Stable-Tag 
# for a list of the most current containers we maintain
ARG BASE_CONTAINER=jupyter/datascience-notebook:python-3.7.12

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

# 3) install packages using notebook user
USER jovyan

# RUN conda install -y scikit-learn

RUN conda install -c conda-forge -c nvidia -c sleap/label/dev -c sleap -c anaconda sleap=1.4.1

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
