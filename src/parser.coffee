path = require 'path'
cson = require 'coffeeson'
yaml = require 'js-yaml'
fs = require 'fs'
async = require 'async'
extend = require 'extend'
toml = require 'toml'

yamlLoader = (filepath, cb) ->

  fs.readFile filepath, "utf-8", (err, str) ->
   
    cb? err if err?
    try
      obj = yaml.safeLoad str
    catch err
      return cb err
    return cb null, obj

tomlLoader = (filepath, cb) ->
  
  fs.readFile filepath, "utf-8", (err, str) ->
    cb? err if err?
    try
      obj = toml.parse str
    catch err
      return cb err
    return cb null, obj

jsonLoader = (filepath, cb) ->
  try
    obj = require filepath
  catch err
    return cb err
  cb null, obj

load = (filepaths..., cb) ->

  obj = {}
  # method runner for each path string
  _ = (filepath, cb) ->

    switch path.extname filepath
      when ".toml" then loader = tomlLoader
      when ".json" then loader = jsonLoader
      when ".cson" then loader = cson
      when ".yml", ".yaml" then loader = yamlLoader
      else
        return cb new Error "Unrecognized file type"

    loader filepath, (err, _obj) ->
      return cb err if err
      extend true, obj, _obj
      cb null, obj

  async.each filepaths, _, (err) ->
    return cb? err if err
    cb null, obj

module.exports = load
