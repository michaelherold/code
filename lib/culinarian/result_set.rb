module Culinarian
  class ResultSet < SimpleDelegator
    def initialize(_ = [])
      super
    end

    def of(step)
      __getobj__.find { |result| result == step }
    end

    def results
      self
    end

    def step(name)
      __getobj__.find { |result| result.named?(name) }
    end
  end
end
