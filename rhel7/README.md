# RHEL 7.4

The .iso image file can be downloaded from [Red Hat Developer Program](https://developers.redhat.com/products/rhel/download/).
## Requirements
* Windows Hyper-V
* Vagrant 2.0.2 - https://www.vagrantup.com/downloads.html
* Packer 1.2.0 - https://www.packer.io/downloads.html
* RHEL 7.4 - https://developers.redhat.com/products/rhel/download/


## Building

$env:PACKER_LOG=1
./packer build -force rhel-7.4-hyperv-iso.json

$env:VAGRANT_LOG=info
vagrant up

## References
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/sect-consoles-logs-during-installation-x86
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/sect-installation-text-mode-x86
https://access.redhat.com/documentation/en-us/red_hat_subscription_management/1/html/rhsm/un-registering
