bs = require 'test-bootstrap'

module.exports = 

  helpTest: (test) ->
  
    command = "./bin/etcd-seed.coffee #{fixturePath("integration.toml")}"

    bs.runner.system command

    do test.done 


  








