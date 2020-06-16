# Builder for QCOW2 images

## Requirements

+ [virtualenv](https://virtualenv.pypa.io/en/latest/)
+ [qemu-utils](https://www.qemu.org/) (for QCOW2 output format)
+ [git](https://git-scm.com/)
+ [kpartx](https://linux.die.net/man/8/kpartx)
+ [debootstrap](https://manpages.debian.org/unstable/debootstrap/debootstrap.8.en.html) (only for Debian based image build)

## Image creation

To create an image edit the AGENT_ELEMENTS variable with your elements and run `bash create-iamge.sh`.

## Create Elements

To create elements add a directory with the element name you wish to deploy on your image as `latest-docker` sample, add your scripts on `install.d` directory and add excution permission to your scripts.

## References

+ [diskimage-builder documentation](https://buildmedia.readthedocs.org/media/pdf/diskimage-builder/latest/diskimage-builder.pdf)
+ [Diskimage builder](https://www.computational.bio.uni-giessen.de/dokuwiki/doku.php?id=cloud:image_builder)
