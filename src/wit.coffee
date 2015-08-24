wit = require 'node-wit'
config = require '../config'

module.exports = (opts, cb) ->
  return cb 'invalid string' unless opts?.string?

  witInput = (config, string, cb) ->
    return cb if err?
    wit.captureTextIntent config, string, (err, output) ->
      cb err, output

  witInput config.wit, opts.string, (err, data) ->
    cb err, data
