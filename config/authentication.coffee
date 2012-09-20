everyauth    = require 'everyauth'
config       = require 'yaml-config'
{ mongoose } = require './database'
User         = mongoose.model('User')

settings = config.readConfig('config/config.yaml', process.env.NODE_ENV)

module.exports = ->
  everyauth.debug = true
  everyauth.twitter
    .consumerKey(settings.twitter.consumerKey)
    .consumerSecret(settings.twitter.consumerSecret)
    .findOrCreateUser (sessions, accessToken, accessSecret, twitterUser) ->
      console.log twitterUser
      User.find { twitter_id: twitterUser.id }, (error, user) ->
        throw error if error
        if !user
          newUser = new User({ twitter_id: twitterUser.id, name: twitterUser.name })
          newUser.save (error, user) -> user
        else
          user
    .redirectPath('/')
