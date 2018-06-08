#!/usr/bin/env bash

:"${VBOX_VERSION:=5.2.6}"

echo "Checking for 'vboxsf' (${VBOX_VERSION})"
if ! grep -q 'vboxsf' /proc/filesystems; then 
  if [ ! -f /tmp/VBoxGuestAdditions.iso ]; then
    curl http://download.virtualbox.org/virtualbox/${VBOX_VERSION}/VBoxGuestAdditions_${VBOX_VERSION}.iso -o /tmp/VBoxGuestAdditions.iso
  fi

  sudo mkdir /media/VBoxGuestAdditions
  mountpoint -q /media/VBoxGuestAdditions || sudo mount -o loop,ro /tmp/VBoxGuestAdditions.iso /media/VBoxGuestAdditions
  sudo yum install -y kernel-devel-`uname -r` gcc binutils make perl bzip2
  #sudo yum install -y gcc kernel-devel "kernel-devel-$(uname -r)" kernel-headers dkms make bzip2 perl
  sudo bash -c 'yes | /media/VBoxGuestAdditions/VBoxLinuxAdditions.run --nox11'
  #sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
  rm /tmp/VBoxGuestAdditions.iso
  sudo umount /media/VBoxGuestAdditions
  sudo rmdir /media/VBoxGuestAdditions
else
  echo "vboxsf already installed"
fi