require 'culinarian/multi_delegator'

RSpec.describe Culinarian::MultiDelegator do
  let(:a) { double(hi: 'hi') }
  let(:b) { double(bye: 'bye') }

  subject(:delegator) { Culinarian::MultiDelegator.new(a, b) }

  it 'does not respond to unknown methods' do
    expect { subject.unknown }.to raise_error(NameError)
  end

  describe '#bye' do
    subject { delegator.bye }

    it { is_expected.to eq('bye') }

    it 'delegates down to b' do
      expect(b).to receive(:bye)
      subject
    end
  end

  describe '#hi' do
    subject { delegator.hi }

    it { is_expected.to eq('hi') }

    it 'delegates down to a' do
      expect(a).to receive(:hi)
      subject
    end
  end
end
