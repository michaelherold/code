RSpec.describe Culinarian::StringConverter do
  subject(:converter) { Culinarian::StringConverter.new }

  describe '#humanize' do
    it 'works' do
      expect(converter.humanize(Culinarian::StringConverter)).to eq('string converter')
    end
  end

  describe '#underscore' do
    it 'works' do
      expect(converter.underscore(Culinarian::StringConverter)).to eq('string_converter')
    end
  end
end
