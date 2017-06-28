jQuery ->
  $('input[type=checkbox]').iCheck({
    checkboxClass: 'icheckbox_square-blue',
    radioClass: 'iradio_square-blue',
    increaseArea: '20%'
  })

jQuery ->
  flash_message = $("#flash_message").text()
  if (flash_message.length > 0)
    showToast(JSON.parse(flash_message));

$(document).on 'turbolinks:load', ->
  $('.dropdown-toggle').dropdown()
