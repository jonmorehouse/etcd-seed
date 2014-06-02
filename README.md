# Etcd Seed
> Load etcd data from configuration files via command line

## Installation

~~~ bash
$ export ETCD_HOST=localhost
$ export ETCD_PORT=4001

$ npm install -g etcd-seed

$ etcd-seed seed.toml seed.json seed.cson seed.yml
~~~

## Supported Filetypes

* json - http://json.org/example.html
* cson https://github.com/jonmorehouse/coffeeson
* yaml http://www.yaml.org/
* toml https://github.com/mojombo/toml

## Hacking

~~~ bash
# mac
$ brew tap jonmorehouse/tap
$ brew install docker-osx
$ docker-osx start
$ eval `docker-osx env`

# start etcd
$ docker run -p 4001:4001 coreos/etcd --addr=$ETCD_HOST:$ETCD_POR

# run tests
$ cake test
~~~

