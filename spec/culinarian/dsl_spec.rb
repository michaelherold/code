RSpec.describe Culinarian::DSL do
  class SampleRecipe
    include Culinarian::DSL
    using Culinarian::UnitRefinements

    hardware_needed cookie_sheet: BakingSheet,
                    cooling_rack: CoolingRack,
                    large_bowl: Bowl,
                    oven: Oven,
                    small_bowl: Bowl

    step(0).with(oven) do
      preheat.to 375.degrees
    end

    step(1).with(small_bowl) do
      mix 2.25.cups.of(Flour), 1.tsp.of(BakingSoda), 1.tsp.of(Salt)
    end
  end

  subject(:recipe) { SampleRecipe.new }

  describe '#hardware' do
    subject { recipe.hardware }

    it do
      is_expected.to eq([Culinarian::BakingSheet.new('cookie_sheet'),
                         Culinarian::CoolingRack.new('cooling_rack'),
                         Culinarian::Bowl.new('large_bowl'),
                         Culinarian::Oven.new('oven'),
                         Culinarian::Bowl.new('small_bowl')])
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

    it { is_expected.to eq([Culinarian::Step.new(0), Culinarian::Step.new(1)]) }
  end
end
