RSpec.describe Culinarian::DSL do
  class SampleRecipe
    include Culinarian::DSL

    hardware_needed small_bowl: Culinarian::Bowl, large_bowl: Culinarian::Bowl
  end

  subject(:recipe) { SampleRecipe.new }

  describe '#hardware' do
    subject { recipe.hardware }

    it do
      is_expected.to eq([Culinarian::Bowl.new('small_bowl'),
                         Culinarian::Bowl.new('large_bowl')])
    end
  end

  describe '#large_bowl' do
    subject { recipe.large_bowl }

    it { is_expected.to eq(Culinarian::Bowl.new('large_bowl')) }
  end

  describe '#small_bowl' do
    subject { recipe.small_bowl }

    it { is_expected.to eq(Culinarian::Bowl.new('small_bowl')) }
  end
end
