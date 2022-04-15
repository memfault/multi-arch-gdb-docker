# Memfault `multi-arch-gdb` Docker image

This is a Docker image that contains the `multi-arch-gdb` tool. It's useful in
cases where installing the conda environment is more challenging than running a
Docker container.

See the conda setup instructions here:

https://mflt.io/coredump-elf-with-gdb

The image is published to `memfault:multi-arch-gdb`. Example usage to analyze a
core file:

```bash
# this repo has an example core + symbol file under the "example" directory
❯ docker run --rm -t -i --volume "$PWD":/data conda-gdb-docker \
    gdb --se example/symbol_file.elf --core coredump.elf
```
