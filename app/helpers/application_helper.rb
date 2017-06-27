module ApplicationHelper
  def menu_active(name)
    (controller_name == name) ? 'active' : ''
  end
end
