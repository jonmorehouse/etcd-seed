mc = require 'multi-config'
Etcd = require 'node-etcd'

# set up configuration and etcd
mc.env "ETCD_HOST", "ETCD_PORT"
etcd = new Etcd mc.etcd.host, mc.etcd.port

module.exports = etcd


