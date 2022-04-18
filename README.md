[![](https://img.shields.io/badge/docker-memfault/multi--arch--gdb-blue?style=flat-square&logo=docker)](https://hub.docker.com/r/memfault/multi-arch-gdb)
[![](https://img.shields.io/badge/github-memfault/multi--arch--gdb--docker-8da0cb?style=flat-square&logo=github)](https://github.com/memfault/multi-arch-gdb-docker)

# Memfault `multi-arch-gdb` Docker image

This is a Docker image that contains the `multi-arch-gdb` tool. It's useful in
cases where installing the conda environment is more challenging than running a
Docker container.

See the conda setup instructions here:

https://mflt.io/coredump-elf-with-gdb

The image is published to Docker Hub as
[`memfault/multi-arch-gdb`](https://hub.docker.com/r/memfault/multi-arch-gdb).

Example usage to analyze a core file:

```bash
# this repo has an example core + symbol file under the "example" directory
❯ docker run --rm -t -i --volume "$PWD":/data memfault/multi-arch-gdb \
    gdb --se example/symbol_file.elf --core coredump.elf
```
