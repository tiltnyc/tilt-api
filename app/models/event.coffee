{ mongoose, Schema } = require '../../config/database'

EventSchema = new Schema
  name:        { type: String, trim: true }
  theme:       { type: String, trim: true }
  start_date:  { type: Date, default: Date.now }
  created_at:  { type: Date, default: Date.now }
  updated_at:  { type: Date, default: Date.now }

mongoose.model('Event', EventSchema)
