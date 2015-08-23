wit = require 'node-wit'
config = require '../config'

module.exports = (opts, cb) ->
  return cb 'invalid string' unless opts?.string?

  wit.captureTextIntent config.wit, opts.string, (err, data) ->
    return cb err if err?

    cb null, data
