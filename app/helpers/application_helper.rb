module ApplicationHelper
  def page_title
    t(controller_name, scope: 'active_record.models')
  end

  def menu_active(name)
    (controller_name == name) ? 'active' : ''
  end
end
