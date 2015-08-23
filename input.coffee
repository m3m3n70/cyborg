cyborg = require('./')

arg = process.argv[2]
!arg = 'what is the distance from sfo to lax'

accountSid = 'AC705e42b0f48c9dc4aa055dd830a816ad'
authToken = 'dfec68a266acd8126f76127c86e30364'
client = require('twilio')(accountSid, authToken)
