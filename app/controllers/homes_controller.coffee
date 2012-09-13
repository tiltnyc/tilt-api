{ mongoose }  = require '../../config/database'
Administrator = mongoose.model('Administrator')

module.exports =
  show: (req, res) ->
    _id = req.session.administrator_id
    Administrator.findOne { _id: _id }, (error, administrator) =>
      throw error if error
      res.render 'homes/show',
        administrator: administrator
