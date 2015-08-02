require 'culinarian/result_set'
require 'culinarian/step_definition'

module Culinarian
  class Step
    include Comparable

    attr_accessor :name

    def initialize(name, prior_results = ResultSet.new)
      @name = name
      @prior_results = prior_results
    end

    def <=>(other)
      name <=> other.name
    end

    def with(hardware, &block)
      StepDefinition.new(@prior_results, hardware).instance_eval(&block)
    end
  end
end
