module CrudHelper
  def format_value(value)
    if value.is_a?(Date) || value.is_a?(DateTime) || value.is_a?(Time)
      l(value)
    elsif value.is_a?(TrueClass) || value.is_a?(FalseClass)
      value ? icon(:check) : icon(:'circle-o')
    else
      value
    end
  end
end
