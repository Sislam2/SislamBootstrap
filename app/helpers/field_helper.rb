module FieldHelper
  def set_field(field, f)
    if field.is_a?(Hash) then
      field_hash(f, field.first[0], field.first[1])
    else
      field_column_type(f, field)
    end
  end

  private
    def default_wrapper_class
      {class: 'col-xs-12 col-md-3'}
    end

    def field_hash(f, field_name, val)
      if val.is_a?(Hash)
        f.input field_name, as: (val[:type]||:string), class: ['form-control', val[:type]], input_html: (val[:options]||{}), wrapper_html: (val[:wrapper_html]||default_wrapper_class)
      else
        f.input field_name, as: val, class: ['form-control', val], wrapper_html: default_wrapper_class
      end
    end

    # Verifica se a coluna existe na tabela e se é um relacionamento
    # se for um relacionamento chama f.association.
    def field_column_type(f, field)
      attribute = resource_class.columns_types[field.to_s]

      return f.association attribute, wrapper_html: default_wrapper_class if !attribute.blank? && attribute.collation
      f.input field, class: 'form-control', wrapper_html: default_wrapper_class
    end
end
