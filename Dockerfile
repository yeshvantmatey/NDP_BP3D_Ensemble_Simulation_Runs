FROM quay.io/jupyter/scipy-notebook:latest

WORKDIR /home/jovyan/work
USER root

# Install python deps (BUT do not include jupyter/jupyterlab/notebook pins inside requirements.txt)
COPY requirements.txt /tmp/requirements.txt
RUN python -m pip install --no-cache-dir -r /tmp/requirements.txt

# Install BP3D from local folder you already have (private repo)
COPY bp3d-main /tmp/bp3d-main
RUN python -m pip install --no-cache-dir /tmp/bp3d-main

# permissions
RUN chown -R jovyan:users /home/jovyan/work
USER jovyan
