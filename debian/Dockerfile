FROM debian:buster-20190910
MAINTAINER Alexander Couzens <lynxis@fe80.eu>

# use snapshots to have a specific state of the debian repository
RUN grep snapshot /etc/apt/sources.list | sed 's/^#//g' > /tmp/sources.list && \
	mv /tmp/sources.list /etc/apt/ && \
	echo 'Acquire::Check-Valid-Until "0";' > /etc/apt/apt.conf.d/10no-check-valid-until

RUN apt-get -qq update && \
	apt-get -qqy install \
		fakeroot \
		debos \
		cpio \
		tar \
		findutils \
		coreutils \
		gzip \
		bzip2 \
		git

ENTRYPOINT /system-transparency/debian/build.sh
# docker run --cap-add=SYS_ADMIN --privileged -it -v $(pwd)/../:/system-transparency/ debos
