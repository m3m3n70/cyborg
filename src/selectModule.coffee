redir = require 'require-dir'

module.exports = (data, cb) ->
  stringify = JSON.stringify(data)

  intent = data.outcomes[0].intent
  confidence = data.outcomes[0].confidence

  console.log confidence
  entities = data.outcomes[0].entities

  modules = redir '../modules', recurse: true
  #console.log modules

  return cb ('confidence too low') unless confidence > 0.5
  return cb ('invalid module') unless typeof modules[intent].index is 'function'
  modules[intent].index data, (err, response) ->
    cb(null, response)
