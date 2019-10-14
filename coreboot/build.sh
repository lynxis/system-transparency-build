#!/bin/sh
#
# MIT
# 2019 Alexander Couzens <lynxis@fe80.eu>
#
# build coreboot reproducible

set -e -x

if [ -z "$COREBOOT_COMMIT" ] ; then
	COREBOOT_COMMIT="master"
fi

if [ -z "$CPUS" ] ; then
	CPUS=$(nproc)
fi

ARCHS="i386-elf"
TOP=$(cd $(dirname $0) && pwd)

cd /tmp/
if [ -d coreboot ] ; then
	echo "coreboot directory exists! rm -rf /tmp/coreboot/"
	exit 1
fi

git clone --recursive https://review.coreboot.org/coreboot.git
cd coreboot
git checkout -b repro-coreboot "$COREBOOT_COMMIT" --force
git submodule update --init --checkout 3rdparty/blobs

for ARCH in ${ARCHS} ; do bash util/crossgcc/buildgcc -j "$(nproc)" -p "$ARCH" ; done
bash util/crossgcc/buildgcc -j "$(nproc)" -P IASL
bash util/xcompile/xcompile > .xcompile

cp "$TOP/coreboot_config" .config
cp "$TOP/linux_config" linux_config
make -j "$CPUS"

# used by docker build
if [ -d /tmp/output ] ; then
	cp /tmp/coreboot/build/coreboot.rom /tmp/output
fi
