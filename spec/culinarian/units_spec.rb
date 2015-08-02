RSpec.describe Culinarian::Unit do
  subject(:unit) { Culinarian::Unit.new(42) }

  describe '#of' do
    subject { unit.of(Culinarian::Ingredient) }

    it { is_expected.to eq(Culinarian::Ingredient.new(Culinarian::Unit.new(42))) }
  end
end

RSpec.describe Culinarian::Minute do
  subject(:unit) { Culinarian::Minute.new(9) }

  describe '#to' do
    subject { unit.to Culinarian::Minute.new(11) }

    it { is_expected.to eq(Culinarian::TimeSpan.new(Culinarian::Minute.new(9), Culinarian::Minute.new(11))) }
  end
end
