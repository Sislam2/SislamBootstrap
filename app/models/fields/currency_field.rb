module Fields
  class CurrencyField < Field
    def initialize(arg, options, reflection=nil)
      options[:type] = :currency
      super
    end
  end
end
