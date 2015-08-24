config = require '../config'
twilio = require 'twilio'

client = new twilio.RestClient config.twilioAccountSid, config.twilioAuthToken

module.exports = (messageData, cb) ->
  return cb 'invalid string' unless opts?.to?

  sendSms = (messageData, cb) ->
    return cb if err?

    client.sms.messages.create messageData, (err, data) ->
      cb err, data
      console.log err unless data
      console.log 'Message sent: ' + data.body
