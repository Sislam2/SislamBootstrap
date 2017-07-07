module ButtonComponents
  def submit_cancel(*args, &block)
    template.content_tag :div, :class => "form-actions" do

        options = args.extract_options!

        # class
        options[:class] = [options[:class], 'btn-success'].compact
        options[:type] = :submit
        args << options
        # with cancel link

        if cancel = options.delete(:cancel)
          template.link_to(cancel, class: 'btn btn-default'){
            '<i class="fa fa-mail-reply"></i>&nbsp;'.html_safe+I18n.t('helpers.links.back')
          }+ '&nbsp;&nbsp;'.html_safe + submit_button_save_with(*args).html_safe
        else
          submit(*args, &block)
        end

    end
  end

  # Refazer
  def submit_button_save_with(*args)
    template.content_tag :div, class: 'btn-group' do
      "#{save_button(*args)} #{dropdown_button} #{dropdown_button_list(*args)}".html_safe
    end
  end

  def save_button(*args)
    template.button_tag(*args){
      template.icon('save')+'&nbsp;'.html_safe + I18n.t('helpers.titles.save', model: template.resource_class)
    }
  end

  def dropdown_button
    template.button_tag(class: "btn btn-success dropdown-toggle", 'data-toggle' => "dropdown", 'aria-haspopup' => true, 'aria-expanded' => false){
      '<span class="caret"></span><span class="sr-only">Toggle Dropdown</span>'.html_safe
    }
  end

  def dropdown_button_list(*args)
    options = {class: 'dropdown-button', type: :submit, value: ""}
    template.content_tag(:ul, class: 'dropdown-menu'){
      btn = ""
      btn << template.content_tag(:li, template.button_tag(I18n.t('helpers.titles.save_and_keep'),options.merge({value: "save_and_keep"})))
      btn << template.content_tag(:li, template.button_tag(I18n.t('helpers.titles.save_and_new'),options.merge({value: "save_and_new"})))
      btn.html_safe
    }
  end
end

SimpleForm::FormBuilder.send :include, ButtonComponents
