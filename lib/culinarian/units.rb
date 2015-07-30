require 'culinarian/ingredients'

module Culinarian
  class Unit
    include Comparable

    attr_accessor :amount
    attr_reader :unit

    def initialize(amount)
      @amount = amount
      @unit = self.class.to_s.split('::').last.downcase
    end

    def <=>(other)
      if other.respond_to?(:convert_to_unit)
        amount <=> other.convert_to_unit(self.class).amount
      else
        amount <=> other
      end
    end

    def convert_to_unit(_klass)
      self
    end

    def of(ingredient)
      ingredient.new(self)
    end

    def to_s
      "#{amount} #{unit}s"
    end
    alias_method :inspect, :to_s
  end

  class Cup < Unit
    def convert_to_unit(klass)
      case klass
      when Cup then self
      when Teaspoon then Teaspoon.new(amount * 48)
      when Tablespoon then Tablespoon.new(amount * 16)
      else self
      end
    end
  end

  class Degree < Unit; end

  class Tablespoon < Unit
    def convert_to_unit(klass)
      case klass
      when Cup then Cup.new(amount / 16.0)
      when Teaspoon then Teaspoon.new(amount * 3)
      when Tablespoon then self
      else self
      end
    end
  end

  class Teaspoon < Unit
    def convert_to_unit(klass)
      case klass
      when Cup then Cup.new(amount / 48.0)
      when Teaspoon then self
      when Tablespoon then Tablespoon.new(amount / 3.0)
      else self
      end
    end
  end
end
