{ mongoose }   = require '../../../config/database'
Administrator  = mongoose.model('Administrator')

module.exports =
  new: (req, res) ->
    res.render 'admin/sessions/new'

  create: (req, res) ->
    params =
      username: req.body.admin.username
      password: req.body.admin.password

    Administrator.findOne params, (error, administrator) ->
      throw error if error
      req.session.administrator_id = administrator._id
      res.redirect '/'

  destroy: (req, res) ->
    req.session.administrator_id = null
    res.redirect '/'
