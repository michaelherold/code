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

  class BakingSheet < Hardware
    def fill_with(*items)
      items = Array(items)
      ingredients.concat(items)
    end

    def ingredients
      @ingredients ||= []
    end
  end

  class Bowl < Hardware
    def ingredients
      @ingredients ||= []
    end

    def mix(*mixers)
      mixers = Array(mixers)
      ingredients.concat(mixers)
    end
    alias_method :mix_gradually, :mix
    alias_method :mix_individually, :mix
  end

  class CoolingRack < Hardware
    def fill_with(*items)
      items = Array(items)
      results.concat(items)
    end

    def results
      @results ||= []
    end
  end

  class Oven < Hardware
    class Baking
      def initialize(oven, items)
        @oven = oven
        @oven.results << items
      end

      def for(time_span)
        @oven.bake_for(time_span)
      end
    end

    class TemperatureChange
      def initialize(oven)
        @oven = oven
      end

      def to(temperature)
        @oven.heat_to(temperature)
      end
    end

    attr_reader :temperature

    def bake(*items)
      Baking.new(self, Array(items))
    end

    def bake_for(time_span)
      @bake_time = time_span
    end

    def heat_to(temperature)
      @temperature = temperature
    end

    def preheat
      TemperatureChange.new(self)
    end

    def results
      @results ||= []
    end
  end
end
