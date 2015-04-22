#!/usr/bin/env bash

sudo apt-add-repository -y ppa:brightbox/ruby-ng
sudo apt-get -y install ruby2.2 ruby-switch
sudo ruby-switch --set ruby2.2
sudo gem install sinatra rethinkdb
