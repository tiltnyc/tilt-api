AdministratorSchema = new Schema
  username:   { type: String, trim: true }
  password:   { type: String, trim: true }
  created_at: { type : Date, default : Date.now}

mongoose.model('Administrator', AdministratorSchema )
