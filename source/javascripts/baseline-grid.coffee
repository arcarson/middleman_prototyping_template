$(document).ready ->
  $(".js-baseline-grid__lines").hide()

  $(".js-baseline-grid__toggle").on "click", ->
    $(".js-baseline-grid__lines").toggle()

