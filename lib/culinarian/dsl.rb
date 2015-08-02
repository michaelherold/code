require 'culinarian/hardware'
require 'culinarian/result_set'
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
        find_or_create_step(name)
      end

      def steps
        @steps ||= []
      end

      private

      def add_hardware(name, klass)
        hardware << klass.new(name)
        define_reader(name)
      end

      def const_missing(name)
        Culinarian.const_get(name)
      rescue NameError
        super
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

      def find_or_create_step(name)
        step = steps.find { |s| s.name == name }

        unless step
          step = Step.new(name, ResultSet.new(@steps.dup))
          steps << step
        end

        step
      end
    end
  end
end
