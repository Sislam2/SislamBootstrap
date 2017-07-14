module Fields
  class Nested < Field
    attr_accessor :attributes, :kclass

    def initialize(arg, options, reflection=nil)
      super
      @reflaction_macro = reflection.macro
      @kclass = reflection.class_name.safe_constantize
      @attributes = @kclass.form_fields
    end

    def name_attribute
      (@name.to_s + '_attributes').to_sym
    end

    def accept_attributes
      {name_attribute => permited_attributes}
    end

    def permited_attributes
      attributes.map(&:name) + [:_destroy, :id]
    end

    def human
      kclass.model_name.human
    end

    def has?
      @reflaction_macro
    end

  end
end
