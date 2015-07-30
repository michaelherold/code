require 'culinarian/string_converter'

module Culinarian
  class Ingredient
    include Comparable

    attr_accessor :amount
    attr_reader :name

    def initialize(unit_amount)
      @amount = unit_amount
      @name = StringConverter.new.humanize(self.class)
    end

    def <=>(other)
      amount <=> other.amount && name <=> other.name
    end

    def to_s
      "#{amount} of #{name}"
    end
    alias_method :inspect, :to_s
  end

  class BakingSoda < Ingredient; end
  class BrownSugar < Ingredient; end
  class Butter < Ingredient; end
  class ChocolateChips < Ingredient; end
  class Egg < Ingredient; end
  class Flour < Ingredient; end
  class Salt < Ingredient; end
  class Sugar < Ingredient; end
  class Vanilla < Ingredient; end
end
