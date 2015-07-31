require 'culinarian/string_converter'
require 'culinarian/refinements/units'

module Culinarian
  class Hardware
    include Comparable
    using Culinarian::UnitRefinements

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

  class Bowl < Hardware
    def ingredients
      @ingredients ||= []
    end

    def mix(*mixers)
      mixers = Array(mixers)
      ingredients.concat(mixers)
    end
  end

  class CoolingRack < Hardware; end

  class Oven < Hardware
    class TemperatureChange
      def initialize(oven)
        @oven = oven
      end

      def to(temperature)
        @oven.heat_to(temperature)
      end
    end

    attr_reader :temperature

    def heat_to(temperature)
      @temperature = temperature
    end

    def preheat
      TemperatureChange.new(self)
    end
  end
end
