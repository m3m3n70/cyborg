express = require('express')

fs = require('fs')

app = express()

app.use '/client', (request, response, next) ->
  coffeeFile = path.join __dirname, "../client", request.path
  file = fs.read coffeeFile, "utf-8", (err, data) ->
    return next() if err?
    response
      .contentType('text/javascript')
      .send coffee.compile data

      cyborg string: arg, (err, data) ->
        console.log JSON.stringify(data, null, 2)

app.listen 3000, ->
  console.log 'listening'

module.exports = app
