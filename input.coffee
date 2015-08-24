wit = require('./src/wit')
#twilio = require './input_modules/twilio'

arg = process.argv[2]
!arg = 'what is the distance from sfo to lax'

console.log arg

wit string: arg, (err, data) ->
  return cb if err?
  console.log data
