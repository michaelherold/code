module Culinarian
  class Step
    include Comparable

    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def <=>(other)
      name <=> other.name
    end

    def with(hardware, &block)
      hardware.instance_eval(&block)
    end
  end
end
