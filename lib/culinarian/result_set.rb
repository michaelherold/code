module Culinarian
  class ResultSet < SimpleDelegator
    def initialize(_ = [])
      super
    end

    def of(name)
      __getobj__.find { |result| result.name == name }
    end

    def results
      self
    end

    def step(name)
      __getobj__.find { |result| result.name == name }
    end
  end
end
