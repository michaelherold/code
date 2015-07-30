require 'culinarian/string_converter'

module Culinarian
  class Hardware
    include Comparable

    attr_accessor :name
    attr_reader :type

    def initialize(name)
      @name = name.to_s
      @type = StringConverter.new.humanize(self.class)
    end

    def <=>(other)
      name <=> other.name
    end

    def to_s
      name
    end
    alias_method :inspect, :to_s
  end

  class BakingSheet < Hardware; end
  class Bowl < Hardware; end
  class CoolingRack < Hardware; end
  class Oven < Hardware; end
end
