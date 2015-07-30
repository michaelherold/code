require 'culinarian/hardware'

module Culinarian
  module DSL
    def self.included(base)
      base.extend(ClassMethods)
    end

    def hardware
      @hardware ||= self.class.hardware.dup
    end

    module ClassMethods
      def hardware
        @hardware ||= []
      end

      def hardware_needed(hardware)
        hardware.each do |name, klass|
          add_hardware(name, klass)
        end
      end

      private

      def add_hardware(name, klass)
        hardware << klass.new(name)
        define_instance_method(name)
      end

      def define_instance_method(name)
        class_eval <<-RUBY, __FILE__, __LINE__ + 1
          def #{name}
            hardware.find { |h| h.name == '#{name}' }
          end
        RUBY
      end
    end
  end
end
