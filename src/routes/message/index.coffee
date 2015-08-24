app = require '../../http'
wit = require '../../wit'
selectModule = require '../../selectModule'
twilio = require '../../../input_modules/twilio'

app.post '/respondToSms', (req, res) ->
  incomingMessage = req.body.Body
  incomingMessageFrom = req.body.From
  incomingMessageTo = req.body.To

  wit string: incomingMessage, (err, data) ->

    selectModule data, (err, data) ->

      console.log data

      messageData =
        to: incomingMessageFrom
        from: incomingMessageTo
        body: data

      twilio to: messageData, (err, data) ->
        response = '<Response><Message>' + messageData.body + '</Message></Response>'
        console.log response
        res.send(response)
