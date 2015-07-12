# Vagrant RethinkDB

[RethinkDB](http://rethinkdb.com) is built to store JSON documents, and scale to multiple machines with very little effort. It has a pleasant query language that supports really useful queries like table joins and group by, and is easy to setup and learn.

Actually, RethinkDB is only available on Ubuntu, OSX, CentOS and Debian. So, if you want to give it a try, you should download [Virtualbox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/).

This provides install scripts for Sinatra, Flask and Express + Ruby, Python and JS drivers.

## Usage

```bash
git clone https://github.com/zoontek/vagrant-rethinkdb.git
cd vagrant-rethinkdb
vagrant up
```

Start an Express server
```bash
vagrant ssh
cd shared/express
sh install.sh
nodejs index.js
```

Start a Sinatra server
```bash
vagrant ssh
cd shared/sinatra
sh install.sh
ruby index.rb
```

Start a Flask server
```bash
vagrant ssh
cd shared/flask
sh install.sh
python index.py
```

## Port forwarding

Vagrant will forward to the host at the exact same ports used by RethinkDB.

- The web UI port: **[localhost:8080](http://localhost:8080)**
- The client driver port: **localhost:28015**
- The intracluster traffic port: **localhost:29015**

But also at **[localhost:3000](http://localhost:3000)** for Express, Sinatra or Flask.
