$(document).ready ->
  $(".accordion-tabs-minimal").each (index) ->
    $(this).find("li .tab-content").hide()
    $(this).children("li").first().children("a").addClass("is-active").next().addClass("is-open").show()
    return

  $(".accordion-tabs-minimal").on "click", "li > a.tab-link", (event) ->
    event.preventDefault()

    unless $(this).hasClass("is-active")
      accordionTabs = $(this).closest(".accordion-tabs-minimal")
      accordionTabs.find(".is-open").removeClass("is-open").hide()
      $(this).next().toggleClass("is-open").toggle()
      accordionTabs.find(".is-active").removeClass "is-active"
      $(this).addClass "is-active"

    return

  return
