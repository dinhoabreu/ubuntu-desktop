Ubuntu 14.04 LTS Desktop VirtualBox Vagrant
========================================================

Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](http://www.vagrantup.com/downloads.html).

Native installers are available for OSX, Windows and Linux.

At the moment of the writing the versions were:

* VirtualBox 4.3.20
* Vagrant 1.6.3

### Package Vagrant box

guest:

    sudo bash /vagrant/scripts/reduce-box.sh

host:

    vagrant package --output ubuntu-desktop.box

### Add box and run

    vagrant box add ubuntu-desktop.box --name dinhoabreu/ubuntu-desktop
    cp Vagrantfile.template /your/project/path/
    cd /your/project/path/
    vagrant up

Note the [exported virtual disk image format](https://www.virtualbox.org/manual/ch08.html#vboxmanage-export) will be VMDK.

Update Ubuntu Desktop
---------------------

### Update packages

    sudo apt-get update
    sudo apt-get -y upgrade
    sudo apt-get -y dist-upgrade
    sudo apt-get clean
    sudo reboot

### Remove old kernels

    # current kernel - don't remove
    uname -r
    # all installed kernels
    dpkg --list | grep linux-image
    # remove old kernels
    sudo apt-get purge linux-image-x.x.x-x-generic
    sudo reboot

### VirtualBox settings

Base memory: 1024 MB

### Update Packages

    sudo apt-get update
    sudo apt-get -y upgrade
    sudo apt-get clean

### Set hostname

    sudo vi /etc/hostname
    sudo vi /etc/hosts
    sudo hostname <HOSTNAME>

### Vagrant configuration

Configure Vagrant to show the desktop before `vagrant up`:

    config.vm.provider "virtualbox" do |vb|
      vb.gui = true
    end
