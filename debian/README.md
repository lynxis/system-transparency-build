# create a reproducible initramfs

Build a debian based initramfs to run as whole image.
Usually an initramfs is only a intermediate phase when booting a linux.
This initramfs contains a fully working image. The idea is to load this
initramfs as one image.

## How to build?

The initramfs is build using [debos](https://github.com/go-debos/debos).

* `apt install fakeroot debos`

# TODO

- Set user/permissions for overlays. The git repository will/may have different rights depending on the build system.
- Clean environment from caller using a whilelist or define all variables.
- Test which environment are giving to the script inside the chroot.
- Create an ansible script which setups the build host

# Acknowledgement

Thanks to the tails project for their reproducible build debian system.
Thanks to the OpenWrt project for the source date epoch functions.
