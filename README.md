# Solvis Platform BSP

## requirements

- ubuntu
- python3
- pip3 install kas
- [yocto docu](https://www.yoctoproject.org/docs/current/brief-yoctoprojectqs/brief-yoctoprojectqs.html): `sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
     pylint3 xterm`


## Prepare SD-Card

`scripts/prepare-sd-card.sh /dev/sdX`

## Build image

Build image with `kas build description.yml`