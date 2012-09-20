{ mongoose, Schema } = require '../../config/database'

TeamSchema = new Schema
  name:        { type: String, trim: true }
  event:       { type: Schema.Types.ObjectId, ref: 'Event' }
  created_at:  { type: Date, default: Date.now }
  updated_at:  { type: Date, default: Date.now }

mongoose.model('Team', TeamSchema)
