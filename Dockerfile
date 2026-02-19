FROM quay.io/jupyter/scipy-notebook:latest

WORKDIR /home/jovyan/work
USER root

# Install your python dependencies
COPY requirements.txt /tmp/requirements.txt
RUN python -m pip install --no-cache-dir -r /tmp/requirements.txt

# Keep permissions sane
RUN chown -R jovyan:users /home/jovyan/work
USER jovyan
