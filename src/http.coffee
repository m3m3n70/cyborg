express = require 'express'
bodyParser = require 'body-parser'
fs = require 'fs'
app = express()

app.use bodyParser()

app.listen 3001, ->
  console.log 'listening'

module.exports = app
