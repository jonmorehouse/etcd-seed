async = require 'async'
parser = require "./parser"
seed = require "./seed"

errorHandler = (err) ->
  console.log err
  return

parseFilepaths = (filepaths) ->
  parser filepaths..., (err, obj) ->
    return errorHandler err if err?
    # seed etcd now
    seed obj, (err) ->
      return errorHandler err if err?

module.exports = 
  parseFilepaths: parseFilepaths
  help: help


