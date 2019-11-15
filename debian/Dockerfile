FROM debian:buster-20190910
MAINTAINER Alexander Couzens <lynxis@fe80.eu>

# use snapshots to have a specific state of the debian repository
RUN grep snapshot /etc/apt/sources.list | sed 's/^#//g' > /tmp/sources.list && \
	mv /tmp/sources.list /etc/apt/ && \
	echo 'Acquire::Check-Valid-Until "0";' > /etc/apt/apt.conf.d/10no-check-valid-until

RUN apt-get -qq update && \
	apt-get -qqy install \
		busybox \
		debootstrap \
		fakeroot \
		cpio \
		tar \
		findutils \
		coreutils \
		gzip \
		bzip2 \
		git \
		golang \
		libc6-dev \
		libostree-dev && \
	rm -rf /var/lib/apt/lists/*

# use our own debos binary
ARG GOPATH=/usr/local/go
ENV GOPATH=${GOPATH}
RUN go get -d github.com/go-debos/debos/cmd/debos
WORKDIR $GOPATH/src/github.com/go-debos/debos/
RUN git remote add stdebos https://github.com/lynxis/debos && \
    git fetch stdebos && git checkout stdebos/docker-chroot
RUN go install github.com/go-debos/debos/cmd/debos && cp ${GOPATH}/bin/debos /usr/local/bin/debos

# patch debootstrap to support docker builds
COPY debootstrap-buster.patch /tmp/debootstrap-buster.patch
WORKDIR /usr/share/debootstrap/
RUN cat /tmp/debootstrap-buster.patch | patch -p1

WORKDIR /
ENTRYPOINT /system-transparency/debian/build.sh
# docker run --cap-add=SYS_ADMIN --privileged -it -v $(pwd)/../:/system-transparency/ debos
