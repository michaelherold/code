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

    step(2).with(large_bowl) do
      mix 1.cup.of(Butter), 0.75.cup.of(Sugar), 0.75.cup.of(BrownSugar), 1.tsp.of(Vanilla)
      mix_individually 2.unit.of(Egg)
      mix_gradually results.of(step(1))
      mix 2.cups.of(ChocolateChips)
    end

    step(3).with(cookie_sheet) do
      fill_with 1.tbsp.of(results.of(step(2)))
    end

    step(4).with(oven) do
      bake(results.of(step(3))).for 9.minutes.to 11.minutes
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

    it do
      is_expected.to eq([Culinarian::Step.new(0),
                         Culinarian::Step.new(1),
                         Culinarian::Step.new(2),
                         Culinarian::Step.new(3),
                         Culinarian::Step.new(4)])
    end
  end
end
