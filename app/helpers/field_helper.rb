module FieldHelper
  def set_field(field, f)
    if field.is_a?(Fields::Nested)
      render "components/nested_attributes_#{field.has?}", form_nested: f, nested_field: field
    elsif field.type?
      f.input field.name, as: field.type,
        class: ['form-control', field.type], input_html: field.options, wrapper_html: default_wrapper_class(field)
    else
      f.input field.name, class: 'form-control', wrapper_html: default_wrapper_class(field)
    end
  end
end
