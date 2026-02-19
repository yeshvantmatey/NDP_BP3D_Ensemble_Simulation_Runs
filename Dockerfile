FROM quay.io/jupyter/scipy-notebook:latest

# Switch to root to install packages
USER root

WORKDIR /home/jovyan/work

# Install your Python dependencies
COPY requirements.txt /tmp/requirements.txt
RUN python -m pip install --no-cache-dir -r /tmp/requirements.txt

# Install BP3D client from GitHub
RUN python -m pip install --no-cache-dir git+https://github.com/BurnPro3D/bp3d.git

# Fix permissions for jovyan user
RUN chown -R jovyan:users /home/jovyan/work

# Switch back to default notebook user
USER jovyan
