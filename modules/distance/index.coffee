request = require 'superagent'

key = 'AIzaSyAU6Y6fqzwK8RK1svvAkS6ZIo4AdM4cdUs'
url = 'https://maps.googleapis.com/maps/api/distancematrix/json'

module.exports = (opts, cb) ->

  request
    .get url
    .query key: key
    .query origins: opts.outcomes[0].entities.locationFrom[0].value
    .query destinations: opts.outcomes[0].entities.locationTo[0].value
    .query language: 'EN-us'
    .query mode: 'driving'
    .end (err, res) ->
      return cb err, res.body.rows[0].elements
