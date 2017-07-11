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
      if field.to_s.end_with?('_id') && resource_class.reflections[field.to_s.gsub('_id','')].present?
        path_json = public_send('api_v1_'+field.to_s.gsub('_id','').pluralize+'_path')
        return f.input field, as: :select2, input_html_options: {'data-url' => path_json }, wrapper_html: default_wrapper_class
      end
      f.input field, class: 'form-control', wrapper_html: default_wrapper_class
    end
end
