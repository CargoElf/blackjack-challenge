require_relative '../blackjack'

RSpec.describe Deck do
  let(:deck) { Deck.new }

  it 'test_new_deck_has_52_playable_cards' do
    expect(deck.playable_cards.size).to eq 52
  end

  it 'test_dealt_card_should_not_be_included_in_playable_cards' do
    card = deck.deal_card
    expect(deck.playable_cards).to_not include card
  end

  it 'test_shuffled_deck_has_52_playable_cards' do
    deck.shuffle
    expect(deck.playable_cards.size).to eq 52
  end
end
