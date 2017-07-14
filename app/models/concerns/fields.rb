module Fields
  extend ActiveSupport::Concern

  self.included do
    def self.add_currency_field(*args,**options)
      collect_fields(CurrencyField, *args, **options){|arg|
        define_method(arg.to_s+'='){|v| super v.gsub('.','').gsub(',','.') }
      }
    end

    def self.add_number_field(*args,**options)
      collect_fields(NumberField, *args, **options)
    end

    def self.add_field(*args,**options)
      collect_fields(Field, *args, **options)
    end

    def self.add_nested_attributes(*args,**options)
      collect_fields(Nested, *args, **options)
    end

    def self.accept_fields
      @fields_collection.map { |e| e.is_a?(Nested) ? e.accept_attributes : e.name }
    end

    def self.form_fields
      @fields_collection
    end

    def self.form_only_fields
      @fields_collection.select_if { |e| e.is_a? Field }
    end

    def self.form_number_fields
      @fields_collection.select_if { |e| e.is_a? NumberField }
    end

    def self.form_currency_fields
      @fields_collection.select_if { |e| e.is_a? CurrencyField }
    end

    def self.form_nested_attributes
      @fields_collection.select_if { |e| e.is_a? Nested }
    end

    private
      @fields_collection = []
      def self.collect_fields(kclass, *args, **options, &block)
        args.each{|arg|
          @fields_collection << kclass.new(arg, options, self.reflections[arg.to_s])
          yield(arg) if block_given?
        }
      end
  end
end
