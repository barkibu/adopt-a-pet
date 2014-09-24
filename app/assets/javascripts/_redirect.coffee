$(document).ready ->
  button = $ '.js-redirect'

  loadRedirect = (url) ->
    $('.js-loader').removeClass('loader-off').addClass('loader-on')
    button.detach()
    setTimeout (->
      redirect(url))
      , 2000

  redirect = (url) ->
    window.location.href = url

  button.click (e) ->
    e.preventDefault()
    loadRedirect $(this).attr('href')
