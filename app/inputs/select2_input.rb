class Select2Input < SimpleForm::Inputs::CollectionSelectInput
  def input(wrapper_options)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    merged_input_options.merge! @options[:input_html_options] if @options[:input_html_options]

    get_collection = attribute_name.to_s.gsub('_id','')
    collection = @builder.object.public_send(get_collection)
    collection = [collection].compact unless collection.is_a?(Array)

    @options[:label_method] ||= :name
    @options[:value_method] ||= :id

    label_method, value_method = detect_collection_methods

    @builder.collection_select(
          attribute_name, collection, value_method, label_method,
          input_options, merged_input_options
    )
  end
end
