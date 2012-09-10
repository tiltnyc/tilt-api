module.exports =
  # Elements

  '^(.*) within (.*)$': (inner, outer) ->
    return "#{@selectorFor(outer)} #{@selectorFor(inner)}"

  '^(.*) containing "([^"]*)"$': (namedElement, text) ->
    return "#{@selectorFor(namedElement)}:contains('#{text}')"

  # Paths
  'the home ?page': '/'
  'the admin login page': '/admin/login/'
