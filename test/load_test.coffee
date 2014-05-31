bs = require 'test-bootstrap'
seed = srcRequire "seed"

module.exports = 

  setUp: (cb) =>
    
    @obj = 
      key: "value"
      dir: 
        key: "value"
        subdir: 
          key: "value"
    cb?()

  testLoad: (test) =>
    seed @obj
    do test.done


