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

    it 'totals aces as 1 if total > 10' do
      hand.cards = [
        card.new(:hearts, :ace, [11, 1]),
        card.new(:hearts, :ten, 10),
        card.new(:spades, :ten, 10)
      ]

      expect(hand.hand_total).to eq 21
    end

    it 'totals aces as 11 if total > 11' do
      hand.cards = [
        card.new(:hearts, :ace, [11, 1]),
        card.new(:spades, :one, 1)
      ]

      expect(hand.hand_total).to eq 12
    end

    it 'totals all ace hand correctly' do
      hand.cards = [
        card.new(:hearts, :ace, [11, 1]),
        card.new(:diamonds, :ace, [11, 1]),
        card.new(:spades, :ace, [11, 1]),
        card.new(:clubs, :ace, [11, 1])
      ]

      expect(hand.hand_total).to eq 14
    end
  end

  describe 'to_s' do
    it 'lists cards in hand as a string' do
      hand.cards = [
        card.new(:hearts, :ace, [11, 1]),
        card.new(:diamonds, :ace, [11, 1]),
        card.new(:spades, :ace, [11, 1]),
        card.new(:clubs, :ace, [11, 1])
      ]

      expect(hand.to_s).to eq(
        "\n| ACE of HEARTS |\n| ACE of DIAMONDS |\n| ACE of SPADES |\n| ACE of CLUBS |"
      )
    end
  end
end
