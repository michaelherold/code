require 'culinarian/hardware'
require 'culinarian/step'

module Culinarian
  module DSL
    def self.included(base)
      base.extend(ClassMethods)
    end

    def hardware
      @hardware ||= self.class.hardware.dup
    end

    def steps
      @steps ||= self.class.steps.dup
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

      def step(name)
        step = Step.new(name)
        steps << step
        step
      end

      def steps
        @steps ||= []
      end

      private

      def add_hardware(name, klass)
        hardware << klass.new(name)
        define_reader(name)
      end

      def define_reader(name)
        line_number = __LINE__ + 1
        reader = <<-RUBY
          def #{name}
            hardware.find { |h| h.name == '#{name}' }
          end
        RUBY

        class_eval reader, __FILE__, line_number
        instance_eval reader, __FILE__, line_number
      end

      def const_missing(name)
        Culinarian.const_get(name)
      rescue NameError
        super
      end
    end
  end
end
