config = require '../config'
twilio = require 'twilio'

client = new twilio.RestClient config.twilioAccountSid, config.twilioAuthToken

messageData =
  to: '4153172907'
  from: '2517324988'
  body: 'testing'

client.sms.messages.create messageData, (err, data) ->
  console.log err unless data
  console.log data
