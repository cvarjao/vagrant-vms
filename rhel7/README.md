# RHEL 7.4

The .iso image file can be downloaded from [Red Hat Developer Program](https://developers.redhat.com/products/rhel/download/).
## Requirements
* Windows Hyper-V
* Vagrant 2.0.2 - https://www.vagrantup.com/downloads.html
* Packer 1.2.0 - https://www.packer.io/downloads.html
* RHEL 7.4 - https://developers.redhat.com/products/rhel/download/

## Recommended
* vagrant-multi-putty - https://github.com/nickryand/vagrant-multi-putty
```
vagrant plugin install vagrant-multi-putty
```

## Building

Create secrets.json file
```
{
  "rhn_user": "<RedHat Developer Network username/e-mail>",
  "rhn_password": "<RedHat Developer Network password>"
}
```

```powershell
$env:PACKER_LOG=1
packer build -force -only=virtualbox-iso "-var-file=secrets.json" rhel-7.4-hyperv-iso.json
```

```powershell
$env:VAGRANT_LOG=info
vagrant box add --name rhel/7 --force rhel-7.4-vbox.box

# findout what adapter to use as bridhe name:
VBoxManage.exe list bridgedifs
vagrant up
```

## References
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/sect-consoles-logs-during-installation-x86
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/sect-installation-text-mode-x86
https://access.redhat.com/documentation/en-us/red_hat_subscription_management/1/html/rhsm/un-registering
