# reproducible build a debian image as initramfs

Reproducible build a debian based initramfs to run a whole image.
Usually an initramfs is only a intermediate phase when booting a linux.
This initramfs contains a fully working image.

## How to build?

The initramfs is build using [debos](https://github.com/go-debos/debos).
The build process requires **root** privileges, because uses mount and debootstrap.

Install the required packages:

* `apt install fakeroot debos`

Start the build process by

* `./build.sh`

##  Docker builds

Docker is not supported (yet). Even privileges container fail to build.

# TODO

- Set user/permissions for overlays. The git repository will/may have different rights depending on the build system.
- Clean environment from caller using a whilelist or define all variables.
- Test which environment are giving to the script inside the chroot.
- Create an ansible script which setups the build host

# Acknowledgement

Thanks to the tails project for their reproducible build debian system.
Thanks to the OpenWrt project for the source date epoch functions.
