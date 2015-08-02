require 'culinarian/units'

module Culinarian
  module UnitRefinements
    refine Numeric do
      def cup
        Cup.new(self)
      end
      alias_method :cups, :cup

      def degree
        Degree.new(self)
      end
      alias_method :degrees, :degree

      def minute
        Minute.new(self)
      end
      alias_method :minutes, :minute

      def tbsp
        Tablespoon.new(self)
      end
      alias_method :tbsps, :tbsp

      def tsp
        Teaspoon.new(self)
      end
      alias_method :tsps, :tsp

      def unit
        Unit.new(self)
      end
      alias_method :units, :unit
    end
  end
end
