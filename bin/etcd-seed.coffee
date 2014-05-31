#!/usr/bin/env coffee
seed = require "../src/index"

args = process.argv[2..]

# parse file as needed
switch args.length
  when 0 then do seed.help
  else
    seed.parseFilepaths args
