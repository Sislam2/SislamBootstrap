//= require adminlte

ajust_turbolinks = ->
  try
    $.AdminLTE.layout.fix()
    $.AdminLTE.controlSidebar.activate()
  catch error

document.addEventListener 'turbolinks:load', ajust_turbolinks
