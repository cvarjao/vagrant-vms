#!/usr/bin/env bash
set -x

echo "Adding the vagrant ssh public key..."

groupadd -g 9999 vagrant
useradd -u 9999 -g vagrant -G wheel vagrant
echo "vagrant" | passwd --stdin vagrant
sed -E -i '/Defaults[[:space:]]+requiretty/ s/^/#/' /etc/sudoers
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

# Fix for https://github.com/CentOS/sig-cloud-instance-build/issues/38
cat >> /etc/sysconfig/network-scripts/ifcfg-eth0 << EOF
DEVICE="eth0"
EOF

sudo -u vagrant mkdir /home/vagrant/.ssh
sudo -u vagrant curl -Lo /home/vagrant/.ssh/authorized_keys https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh
