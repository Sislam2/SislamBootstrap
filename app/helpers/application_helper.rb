module ApplicationHelper
  def menu_active(name)
    (controller_name == name) ? 'active' : ''
  end

  def menu_link(name, icon_name)
      content_tag(:li, class: menu_active(name)) do
        link_to(public_send(name+'_path'), 'data-turbolinks-action' => "replace") {
          icon(icon_name) + content_tag(:span, t(name.singularize, scope: 'activerecord.models').pluralize)
        }
      end
  end

end
