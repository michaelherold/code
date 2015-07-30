def example_unit
  Culinarian::Cup.new(42)
end

RSpec.describe Culinarian::Ingredient do
  subject(:ingredient) { Culinarian::Ingredient.new(example_unit) }

  describe '#to_s' do
    subject { ingredient.to_s }

    it { is_expected.to eq('42 cups of ingredient') }
  end
end
