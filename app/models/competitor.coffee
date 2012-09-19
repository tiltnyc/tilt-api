{ mongoose, Schema } = require '../../config/database'

CompetitorSchema = new Schema
  team_id:     { type:  Schema.Types.ObjectId, ref: 'Team' }
  user_id:     { type:  Schema.Types.ObjectId, ref: 'User' }
  created_at:  { type:  Date, default: Date.now }
  updated_at:  { type:  Date, default: Date.now }

mongoose.model('Competitor', CompetitorSchema)
