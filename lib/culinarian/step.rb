require 'culinarian/result_set'
require 'culinarian/step_definition'

module Culinarian
  class Step
    include Comparable

    attr_accessor :name

    def initialize(name, prior_results = ResultSet.new)
      @name = name.to_s
      @prior_results = prior_results
    end

    def <=>(other)
      name <=> other.name
    end

    def named?(name)
      self.name == name.to_s
    end

    def new(*)
      self
    end

    def with(hardware, &block)
      StepDefinition.new(@prior_results, hardware).instance_exec(&block)
    end
  end
end
