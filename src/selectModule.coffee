redir = require 'require-dir'

module.exports = (data, cb) ->
  stringify = JSON.stringify(data)

  intent = data.outcomes[0].intent
  confidence = data.outcomes[0].confidence
  entities = data.outcomes[0].entities

  #console.log data
  console.log 'confidence: ' + confidence

  modules = redir '../modules', recurse: true
  #console.log modules

  return cb null, 'low confidence' unless confidence > 0.5
  return cb null, 'invalid module' unless typeof modules[intent].index is 'function'
  modules[intent].index data, (err, response) ->
      cb(null, response)
