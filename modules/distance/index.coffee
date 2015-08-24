request = require 'superagent'

key = 'AIzaSyAU6Y6fqzwK8RK1svvAkS6ZIo4AdM4cdUs'
url = 'https://maps.googleapis.com/maps/api/distancematrix/json'

module.exports = (opts, cb) ->
  console.log(opts)

  createQuery = (opts, cb) ->
    locationFrom: opts.outcomes[0].entities.locationFrom[0].value
    locationTo: opts.outcomes[0].entities.locationTo[0].value

    inatiateQuery locationFrom, locationTo, (err, response) ->

      request
        .get url
        .query key: key
        .query origins: locationFrom
        .query destinations: locationTo
        .query language: 'EN-us'
        .query mode: 'driving'
        .end (err, res) ->
          result = res.body.rows[0].elements[0]
          if result.distance?.text?
            return cb err, result.distance.text
            console.log ('meow')
          else
            return cb err, 'sorry i got nothing'

  #response
