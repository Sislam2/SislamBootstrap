class StringInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options = nil)
    wrapper_options[:maxlength] ||= 255
    super
  end
end
