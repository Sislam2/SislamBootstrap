//= require adminlte
//= require 'jquery-icheck'

jQuery ->
  $('input[type=checkbox]').iCheck({
    checkboxClass: 'icheckbox_square-blue',
    radioClass: 'iradio_square-blue'
  })

ajust_turbolinks = ->
  try
    $.AdminLTE.layout.fix()
    $.AdminLTE.controlSidebar.activate()
  catch error

document.addEventListener 'turbolinks:load', ajust_turbolinks
