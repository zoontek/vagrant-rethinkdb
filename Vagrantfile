# -*- mode: ruby -*-
# vi: set ft=ruby :

# Ensure a minimum Vagrant version
Vagrant.require_version ">= 1.6.0"

# Provision script
$script = <<SCRIPT
#!/usr/bin/env bash

# Install rethinkDB
source /etc/lsb-release && echo "deb http://download.rethinkdb.com/apt $DISTRIB_CODENAME main" | sudo tee /etc/apt/sources.list.d/rethinkdb.list
wget -qO- http://download.rethinkdb.com/apt/pubkey.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get -y --force-yes install rethinkdb

# Autostart rethinkDB on startup
sudo echo "rethinkdb --bind all &" > /etc/rc.local
sudo echo "exit 0" >> /etc/rc.local

# Start rethinkDB after provisioning
rethinkdb --bind all &
SCRIPT

Vagrant.configure(2) do |config|
  # Configure the box
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_version = "~> 14.04"
  config.vm.hostname = hostname = "rethinkdb"

  # Configure virtualbox settings
  config.vm.provider :virtualbox do |vb|
    vb.name = hostname
    vb.customize ["modifyvm", :id, "--memory", "512"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
    vb.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
  end

  # Configure port forwarding
  config.vm.network :forwarded_port, guest: 8080, host: 8080
  config.vm.network :forwarded_port, guest: 28015, host: 28015
  config.vm.network :forwarded_port, guest: 29015, host: 29015
  
  # Execute provision script
  config.vm.provision "shell", inline: $script
end
