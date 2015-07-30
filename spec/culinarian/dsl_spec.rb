RSpec.describe Culinarian::DSL do
  class SampleRecipe
    include Culinarian::DSL
    using Culinarian::UnitRefinements

    hardware_needed small_bowl: Bowl, large_bowl: Bowl

    step(0).with(small_bowl) do
      mix 1.cup.of(Butter)
    end
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

  describe '#steps' do
    subject { recipe.steps }

    it { is_expected.to eq([Culinarian::Step.new(0)]) }
  end
end
