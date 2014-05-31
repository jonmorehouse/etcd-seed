bs = require "test-bootstrap"
parser = srcRequire "parser"

module.exports = 

  testFilepath: (test) ->

    parser fixturePath("test.json"), (err, obj) ->

      test.deepEqual obj, {jsonKey: "value"}
      do test.done

  testFilepaths: (test) -> 

    parser fixturePath("test.json"), fixturePath("test.yml"), (err, obj) ->
    
      for key in ["jsonKey", "yamlKey"] 
        test.equal true, obj[key]?
        test.equal obj[key], "value"
      do test.done


