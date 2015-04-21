# -*- mode: ruby -*-
# vi: set ft=ruby :

# Ensure a minimum Vagrant version
Vagrant.require_version ">= 1.6.0"

# Provision script
$script = <<SCRIPT
#!/usr/bin/env bash

# Add RethinkDB repository
source /etc/lsb-release && echo "deb http://download.rethinkdb.com/apt $DISTRIB_CODENAME main" | sudo tee /etc/apt/sources.list.d/rethinkdb.list
wget -qO- http://download.rethinkdb.com/apt/pubkey.gpg | sudo apt-key add -

# Add Ruby repository
sudo apt-add-repository -y ppa:brightbox/ruby-ng

# Update packages list
sudo apt-get update

# Install languages packages
sudo apt-get -y install python2.7 python2.7-dev python-pip
sudo apt-get -y install ruby2.2 ruby2.2-dev ruby-switch
sudo apt-get -y install nodejs npm
sudo apt-get -y install rethinkdb

# Switch to ruby 2.2
sudo ruby-switch --set ruby2.2

# Install micro-frameworks + RethinkDB drivers
sudo pip install flask rethinkdb
sudo gem install bundler sinatra rethinkdb
cd /home/vagrant/shared/express
npm install
SCRIPT

Vagrant.configure(2) do |config|
  # Configure the box
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_version = "~> 14.04"
  config.vm.hostname = hostname = "rethinkdb"

  # Configure Virtualbox settings
  config.vm.provider :virtualbox do |vb|
    vb.name = hostname
    vb.customize ["modifyvm", :id, "--memory", "512"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
    vb.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
  end
  
  # Define synced folder
  config.vm.synced_folder "./shared", "/home/vagrant/shared"

  # Configure port forwarding
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 8080, host: 8080 # RethinkDB Web UI
  config.vm.network :forwarded_port, guest: 28015, host: 28015 # Client driver
  config.vm.network :forwarded_port, guest: 29015, host: 29015 # Intracluster traffic
  
  # Execute provision script
  config.vm.provision "shell", inline: $script
end
