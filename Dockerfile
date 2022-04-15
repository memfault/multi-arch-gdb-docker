FROM ubuntu:jammy-20220404

RUN apt-get update && apt-get install -y \
  wget \
  && rm -rf /var/lib/apt/lists/*


ARG MINICONDA_VERSION=4.12.0-0
RUN \
    wget --no-verbose https://github.com/conda-forge/miniforge/releases/download/${MINICONDA_VERSION}/Mambaforge-${MINICONDA_VERSION}-Linux-x86_64.sh \
    && bash Mambaforge-${MINICONDA_VERSION}-Linux-x86_64.sh -b -p /opt/miniconda \
    && rm -f Mambaforge-${MINICONDA_VERSION}-Linux-x86_64.sh

COPY environment.yml /tmp/
RUN . /opt/miniconda/etc/profile.d/conda.sh \
    && conda env create -f /tmp/environment.yml

# cyrus dashboard
RUN cd ~ \
    && wget --no-verbose https://github.com/cyrus-and/gdb-dashboard/tarball/bf619ab2129f70cd239c2361d6571333f08c7a08 -O - | tar -xz \
    && echo "source $(echo ~/cyrus-and-gdb-dashboard-*/.gdbinit)" >> ~/.gdbinit

# suppress startup screen in gdb
RUN echo "set startup-quietly on" >> ~/.gdbearlyinit

# store history in container; otherwise we'll be writing a "root" owned
# .gdb_history file in the mounted /data directory
RUN echo "set history filename ~/.gdb_history" >> ~/.gdbinit

# entrypoint to run commands from within the conda environment
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

WORKDIR /data
