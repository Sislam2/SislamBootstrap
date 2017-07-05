class CurrencyInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    currency = options.delete(:currency) || default_currency
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    merged_input_options[:type]  ||= "text"
    merged_input_options[:placeholder]  ||= "0,00"

    content_tag(:div, input_group(currency, merged_input_options), class: "input-group")
  end

  private

  def input_group(currency, merged_input_options)
    "#{currency_addon(currency)} #{@builder.text_field(attribute_name, merged_input_options)}".html_safe
  end

  def currency_addon(currency)
    content_tag(:span, currency, class: "input-group-addon")
  end

  def default_currency
    I18n.t('number.currency.format.unit')
  end
end
