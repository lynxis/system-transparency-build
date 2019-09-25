# build coreboot reproducible
#
# License: MIT
# 2019 Alexander Couzens <lynxis@fe80.eu>
#
# required volumes:
# - /tmp/output - coreboot.rom will be copied here
# - /home/coreboot/repro-coreboot (read-only) - the path where this files is located
#
# required environments:
# - COREBOOT_COMMIT - a commit or tag which will be build

FROM coreboot/coreboot-sdk:d70f5fae1c
MAINTAINER Alexander Couzens <lynxis@fe80.eu

User root
RUN \
	apt-get -qq update && \
	apt-get -qqy install \
		golang \
	&& apt-get clean

RUN mkdir /tmp/output && chown coreboot:coreboot /tmp/output
USER coreboot
VOLUME /tmp/output
