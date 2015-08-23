app = require '../../http'

app.post '/respondToSms', (req, res) ->
  console.log req.body
