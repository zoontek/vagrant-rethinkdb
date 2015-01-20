# Vagrant RethinkDB

[RethinkDB](http://rethinkdb.com) is built to store JSON documents, and scale to multiple machines with very little effort. It has a pleasant query language that supports really useful queries like table joins and group by, and is easy to setup and learn.

Actually, RethinkDB is only available on Ubuntu, OSX, CentOS and Debian. So, if you want to give it a try, you should download [Virtualbox](https://www.virtualbox.org/) and [Vagrant](https://www.vagrantup.com/).

This installs Ruby, Python and JS RethinkDB drivers + Sinatra, Flask and ExpressJS.

## Usage

```bash
git clone https://github.com/zoontek/vagrant-rethinkdb.git
cd vagrant-rethinkdb
vagrant up
```

```bash
vagrant ssh
```

Start RethinkDB
```bash
rethinkdb --bind all &
```

Launch ExpressJS server
```bash
cd shared/express
nodejs index.js
```

Launch Sinatra server
```bash
cd shared/sinatra
ruby index.rb
```

Launch Flask server
```bash
cd shared/flask
python index.py
```

## Port forwarding

Vagrant will forward to the host at the exact same ports used by RethinkDB.

- The web UI port: **[localhost:8080](http://localhost:8080)**
- The client driver port: **localhost:28015**
- The intracluster traffic port: **localhost:29015**
