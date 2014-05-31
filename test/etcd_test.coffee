bs = require "test-bootstrap"
etcd = srcRequire 'etcd'

module.exports = 

  setUp: (cb) ->
    etcd.set "key", "value", (err) ->
      cb?()

  testClient: (test) ->
    etcd.get "key", (err, value) ->
      test.equals "value", value.node.value
      do test.done
  


