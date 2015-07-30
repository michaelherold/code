RSpec.describe Culinarian::Unit do
  subject(:unit) { Culinarian::Unit.new(42) }

  describe '#of' do
    subject { unit.of(Culinarian::Ingredient) }

    it { is_expected.to eq(Culinarian::Ingredient.new(Culinarian::Unit.new(42))) }
  end
end
