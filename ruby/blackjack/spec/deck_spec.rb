require_relative '../deck'

RSpec.describe Deck do
  let(:deck) { Deck.new }

  describe '.attributes' do
    it 'test_new_deck_has_52_playable_cards' do
      expect(deck.playable_cards.size).to eq 52
    end

    it 'test_dealt_card_should_not_be_included_in_playable_cards' do
      card = deck.deal_card
      expect(deck.playable_cards).to_not include card
    end

    it 'test_shuffled_deck_has_52_playable_cards' do
      6.times { deck.playable_cards.pop }
      deck.shuffle
      expect(deck.playable_cards.size).to eq 52
    end

    describe '.deal_card' do
      it 'returns a card instance' do
        expect(deck.deal_card).to be_instance_of Card
      end

      it 'takes a card from the deck' do
        deck.deal_card
        expect(deck.playable_cards.size).to eq 51
      end
    end
  end
end
