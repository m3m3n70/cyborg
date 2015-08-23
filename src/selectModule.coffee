redir = require 'require-dir'

module.exports = (data, cb) ->
  stringify = JSON.stringify(data)
  entities = data.outcomes[0].entities

  modules = redir '../modules', recurse: true
  console.log modules

  cb(null, data)
