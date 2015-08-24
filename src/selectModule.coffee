redir = require 'require-dir'

module.exports = (data, cb) ->
  stringify = JSON.stringify(data)

  intent = data.outcomes[0].intent
  confidence = data.outcomes[0].confidence
  entities = data.outcomes[0].entities

  #console.log data
  console.log 'confidence: ' + confidence

  modules = redir '../modules', recurse: true

  return cb null, 'sorry, I cannot answer that because im only ' + confidence*100 + '% confident im right :|' unless confidence > 0.5
  return cb null, 'invalid module' unless typeof modules[intent].index is 'function'

  console.log data.outcomes[0].entities

  modules[intent].index data, (err, response) ->
      cb(null, response)
