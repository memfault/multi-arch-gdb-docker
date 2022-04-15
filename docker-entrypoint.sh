#!/usr/bin/env bash

set -e

# activate the conda environment
source /opt/miniconda/etc/profile.d/conda.sh
conda activate memfault-multi-arch-gdb

# run all args within the environment
$@
