bs = require "test-bootstrap"

task "build", "Build js library", ->

  bs.tasks.build()

task "run", "Run server", ->

  bs.runner.system "coffee bin/test.coffee"

task "test", "Test entire project", ->

  bs.tasks.nodeunit "test/etcd_test.coffee"



