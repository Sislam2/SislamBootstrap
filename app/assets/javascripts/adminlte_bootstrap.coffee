//= require adminlte

turbolinks_init_adminlte = true

$(document).on 'turbolinks:load', ->
  if $.AdminLTE.pushMenu && turbolinks_init_adminlte
    turbolinks_init_adminlte = false
    $.AdminLTE.pushMenu.activate("[data-toggle='offcanvas']")
