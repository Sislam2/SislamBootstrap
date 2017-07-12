App.notifications = App.cable.subscriptions.create('NotificationChannel', {
  render_data: (message)->
    return "<li><a href='#' data-behavior='notification-items'>#{message}</a></li>"

  received: (data)->
    $("[data-behavior='notifications-unread-count']").text(data.unread)
    if data.items
      $("[data-behavior='notification-items']").append(@render_data(item.message)) for item in data.items
    else
      $("[data-behavior='notification-items']").append(@render_data(data.message))

  mark_all_read: ->
    App.notifications.perform('mark_all_read')
    $("[data-behavior='notifications-unread-count']").text(0)
    $("[data-behavior='notification-items']").html("")

  mark_read: (id)->
    App.notifications.perform('mark_read',{notification_id: id})

});
