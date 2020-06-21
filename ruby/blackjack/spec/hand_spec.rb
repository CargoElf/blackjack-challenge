require_relative '../hand'

RSpec.describe Hand do
  let(:card) { Struct.new(:suit, :name, :value) }
  let(:hand) { Hand.new }

  describe '.attributes' do
    let(:ten_hearts) { card.new(:hearts, :ten, 10) }

    before do
      hand.cards << ten_hearts
    end

    it 'has cards' do
      expect(hand.cards).to eq [ten_hearts]
    end

    it 'can add to cards' do
      hand.cards << ten_hearts
      expect(hand.cards).to eq [ten_hearts, ten_hearts]
    end
  end

  describe '.hand_total' do
    it 'returns the correct total' do
      hand.cards = [
        card.new(:hearts, :ten, 10),
        card.new(:spades, :ten, 10)
      ]
      expect(hand.hand_total).to eq 20
    end

    xit 'totals aces as 1 if total > 10' do

    end
  end
end
