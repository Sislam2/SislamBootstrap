module Fields
  class Field
    attr_accessor :type, :name, :options, :precision

    def initialize(arg, options, reflection=nil)
      @name = arg
      @type = options[:type]
      @options = options[:options]||{}
    end

    def type?
      !@type.blank?
    end

    def options?
      !@options.blank?
    end
  end
end
