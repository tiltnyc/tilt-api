mongoose = require 'mongoose'
config   = require 'yaml-config'

settings = config.readConfig('config/config.yaml', process.env.NODE_ENV)

mongoose.connect settings.db.uri

module.exports =
  mongoose: mongoose
  Schema: mongoose.Schema
  ObjectId: mongoose.Types.ObjectId
