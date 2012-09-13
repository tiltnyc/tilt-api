module.exports =
  show: (req, res) ->
    if req.session.administrator_id
      res.render 'admin/dashboard/show'
    else
      res.redirect '/'
