require_relative '../lib/game_elements/dealer'

RSpec.describe Dealer do
  let(:dealer)  { Dealer.new }
  let(:hand)    { Hand.new }

  describe '.hit?' do
    it 'returns true if points are under 17' do
      dealer.hand = hand
      dealer.hand.cards = [
        Card.new(:hearts, :ace, [11, 1]),
        Card.new(:hearts, :one, 1)
      ]

      expect(dealer.hit?).to be true
    end

    it 'returns false if points are over 16' do
      dealer.hand = hand
      dealer.hand.cards = [
        Card.new(:hearts, :ace, [11, 1]),
        Card.new(:hearts, :ten, 10)
      ]

      expect(dealer.hit?).to be false
    end
  end
end
