ARG BASE_CONTAINER=ucsdets/datascience-notebook:2023.2-stable
FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

USER root

# Debian packages required by course configuration
RUN apt-get update && apt-get -qq install -y \
	hdf5-tools g++ pkg-config

RUN pip install --no-cache PyQt5

RUN pip install datascience
RUN pip install okpy

# Pre-generate font cache so the user does not see fc-list warning when
# importing datascience. https://github.com/matplotlib/matplotlib/issues/5836
RUN python -c 'import matplotlib.pyplot'

# Remove pyqt and qt, since we do not need them with notebooks
RUN conda remove --quiet --yes --force qt pyqt PyQt5 || true
RUN conda clean -tipsy

#########################
# course-specific stuff
RUN pip install 'allensdk>=2.14.0' 'neurosynth>=0.3.8' 'hdmf>=1.6.3' 'numpy>=1.22.1' 'pynwb>=1.3.2' 'scipy>=1.10.0'
