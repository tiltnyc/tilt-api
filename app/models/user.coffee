{ mongoose, Schema } = require '../../config/database'

UserSchema = new Schema
  name:        { type:  String, trim:   true }
  email:       { type:  String, trim:   true }
  twitter_id:  { type:  String, trim:   true }
  created_at:  { type:  Date, default:  Date.now }
  updated_at:  { type:  Date, default:  Date.now }

mongoose.model('User', UserSchema)
