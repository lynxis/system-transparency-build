# build coreboot reproducible

## Docker builds

To build it with docker, an output directory is required to be mounted as */tmp/output*.

```
docker build -t repro-coreboot:$(git describe --always) .
mkdir output
chmod 777 output
docker run -e COREBOOT_COMMIT=4.10 -v $(pwd):/home/coreboot/repro-coreboot:ro repro-coreboot:$(git describe --always) /home/coreboot/repro-coreboot/build.sh
```

## direct build on a system

To reduce build path dependency, the build.sh expects to build coreboot under **/tmp/coreboot/**.

```
export COREBOOT_COMMIT=4.10
./build.sh
```

## How the build process works

It follows the coreboot build system.

* checkout coreboot repository with a specific commit
* build the coreboot toolchain
* build coreboot and the full rom (e.g. LinuxBoot, u-root, [..])
