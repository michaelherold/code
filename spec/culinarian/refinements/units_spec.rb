RSpec.describe Culinarian::UnitRefinements do
  using Culinarian::UnitRefinements

  context 'for integers' do
    subject(:number) { 42 }

    describe '#cup' do
      subject { number.cup }

      it { is_expected.to eq Culinarian::Cup.new(42) }
    end

    describe '#degree' do
      subject { number.degree }

      it { is_expected.to eq Culinarian::Degree.new(42) }
    end

    describe '#minute' do
      subject { number.minute }

      it { is_expected.to eq Culinarian::Minute.new(42) }
    end

    describe '#tbsp' do
      subject { number.tbsp }

      it { is_expected.to eq Culinarian::Tablespoon.new(42) }
    end

    describe '#tsp' do
      subject { number.tsp }

      it { is_expected.to eq Culinarian::Teaspoon.new(42) }
    end

    describe '#unit' do
      subject { number.unit }

      it { is_expected.to eq Culinarian::Unit.new(42) }
    end
  end
end
