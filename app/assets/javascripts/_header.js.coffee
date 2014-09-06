$(document).ready ->
  menu = $(".centered-navigation-menu")
  menuToggle = $(".centered-navigation-menu-button")
  signUp = $(".sign-up")
  $(menuToggle).on "click", (e) ->
    e.preventDefault()
    menu.slideToggle ->
      menu.removeAttr "style"  if menu.is(":hidden")
      return

    return

  return