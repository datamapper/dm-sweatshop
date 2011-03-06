module DataMapper
  class Sweatshop
    module ClassAttributes
      def self.reader(klass, *attributes)
        attributes.each do |attribute|
          klass.class_eval(<<-RUBY, __FILE__, __LINE__ + 1)
            unless defined? @@#{attribute}
              @@#{attribute} = nil
            end

            def self.#{attribute}
              @@#{attribute}
            end

            def #{attribute}
              @@#{attribute}
            end
          RUBY
        end
      end

      def self.writer(klass, *attributes)
        attributes.each do |attribute|
          klass.class_eval(<<-RUBY, __FILE__, __LINE__ + 1)
            unless defined? @@#{attribute}
              @@#{attribute} = nil
            end

            def self.#{attribute}=(obj)
              @@#{attribute} = obj
            end

            def #{attribute}=(obj)
              @@#{attribute} = obj
            end
          RUBY
        end
      end

      def self.accessor(klass, *attributes)
        self.reader(klass, *attributes)
        self.writer(klass, *attributes)
      end
    end
  end
end
