{ mongoose, Schema } = require '../../config/database'

CompetitorSchema = new Schema
  team:        { type:  Schema.Types.ObjectId, ref: 'Team' }
  user:        { type:  Schema.Types.ObjectId, ref: 'User' }
  created_at:  { type:  Date, default: Date.now }
  updated_at:  { type:  Date, default: Date.now }

mongoose.model('Competitor', CompetitorSchema)
