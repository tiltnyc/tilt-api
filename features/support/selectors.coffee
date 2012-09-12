module.exports =
  # Elements

  '^(.*) within (.*)$': (inner, outer) ->
    return "#{@selectorFor(outer)} #{@selectorFor(inner)}"

  '^(.*) containing "([^"]*)"$': (namedElement, text) ->
    return "#{@selectorFor(namedElement)}:contains('#{text}')"

  # Paths
  'the admin login page': '/admin/login/'
  'the home ?page': '/'
  'the admin dashboard': '/admin/dashboard'
