submitLoginForm = (event) ->
  event.preventDefault()
  form = $(event.target)
  errorP = form.find('p.error')

  email = form.find('input[name=email]').val()
  if email.indexOf('@') is -1
    errorP.text('Please enter a valid email')
    return

  password = form.find('input[name=password]').val()
  if not password
    errorP.text('Please enter your password')
    return

  tabcat.couch.login(name: email, password: password).then(
    (->
      # don't magically restart an encounter just because it's sitting
      # around in localStorage
      tabcat.encounter.clear()

      redirPath = tabcat.ui.readHashJSON().redirPath
      # only allow redirects to a different path, not to other sites
      if not (redirPath? and redirPath.substring(0, 1) is '/')
        redirPath = 'encounter.html'

      window.location = redirPath
    ),
    (xhr) -> switch xhr.status
      when 401 then errorP.text(
        'Incorrect email or password')
      else errorP.text(xhr.textStatus or 'Unknown error')
  )

$(->
  $('form.login').on('submit', submitLoginForm)
  $('form.login button').removeAttr('disabled')
  message = tabcat.ui.readHashJSON().message
  if message
    $('form.login p.error').text(message)
)
