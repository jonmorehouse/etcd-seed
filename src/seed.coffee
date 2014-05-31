etcd = require "./etcd"
async = require "async"

module.exports = (obj, cb) ->

  keys = []

  # recursively iterate through object and make directories as needed
  _ = (obj, dir) =>
    
    for key, value of obj 
      switch typeof value
        when "object"
          if dir?
            _ value, "#{dir}/#{key}"
          else
            _ value, key
        else
          if dir?
            keys.push ["#{dir}/#{key}", value]
          else
            keys.push [key, value]

  # generate list of key tuples
  _ obj
  
  # now set all keys accordingly
  async.each keys, ((k, cb) -> etcd.set k[0], k[1], cb), (err) ->
    cb?()

