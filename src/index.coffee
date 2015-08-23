wit = require 'node-wit'
config = require '../config'
selectModule = require './selectModule'

module.exports = (opts, cb) ->
  return cb 'invalid string' unless opts?.string?

  wit.captureTextIntent config.wit, opts.string, (err, data) ->
    return cb err if err?
    selectModule data, (err, output) ->
      cb null, output
