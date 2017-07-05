module ButtonComponents
  def submit_cancel(*args, &block)
    template.content_tag :div, :class => "form-actions" do

        options = args.extract_options!

        # class
        options[:class] = [options[:class], 'btn-success'].compact
        args << options
        # with cancel link

        if cancel = options.delete(:cancel)
          template.link_to(cancel, class: 'btn btn-default'){
            '<i class="fa fa-mail-reply"></i>&nbsp;'.html_safe+I18n.t('helpers.links.back')
          }+ '&nbsp;&nbsp;'.html_safe + template.button_tag(*args){ template.icon('save')+'&nbsp;'.html_safe+I18n.t('helpers.titles.save', model: template.resource_class) }
        else
          submit(*args, &block)
        end

    end
  end
end

SimpleForm::FormBuilder.send :include, ButtonComponents
