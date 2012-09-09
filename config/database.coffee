mongoose = require 'mongoose'
config   = require 'yaml-config'
settings = config.readConfig('config/app.yaml', process.env.NODE_ENV)

mongoose.connect settings.db.uri

exports = mongoose
exports = Schema = mongoose.Schema
