FROM quay.io/jupyter/scipy-notebook:latest

WORKDIR /home/jovyan/work
USER root

# 1) Install your notebook/runtime deps (from your venv freeze)
COPY requirements.txt /tmp/requirements.txt
RUN python -m pip install --no-cache-dir -r /tmp/requirements.txt

# 2) Install BP3D from local source (private repo you downloaded)
#    This avoids GitHub auth inside Docker build.
COPY bp3d-main /tmp/bp3d-main
RUN python -m pip install --no-cache-dir /tmp/bp3d-main

# Fix permissions for jovyan user
RUN chown -R jovyan:users /home/jovyan/work

USER jovyan
