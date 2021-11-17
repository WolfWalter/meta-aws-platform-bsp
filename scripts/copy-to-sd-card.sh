#! /bin/sh

if [ $# -ne 1 ]; then
  echo "Usage: $0 <media dir>"
  exit 1;
fi

MEDIA_DIR=$1

rm -rf $MEDIA_DIR/boot/*
cp -r build/tmp/deploy/images/raspberrypi4-64/bootfiles/* $MEDIA_DIR/boot

sudo rm -rf $MEDIA_DIR/rootfs/*
sudo tar -xjvf build/tmp/deploy/images/raspberrypi4-64/solvispi-image-raspberrypi4-64.tar.bz2 -C $MEDIA_DIR/rootfs