require_relative '../card'

RSpec.describe Card do
  describe '.attributes' do
    let(:card) { Card.new(:hearts, :ten, 10) }

    it 'test_card_suit_is_correct' do
      expect(card.suit).to eq :hearts
    end

    it 'test_card_name_is_correct' do
      expect(card.name).to eq :ten
    end

    it 'test_card_value_is_correct' do
      expect(card.value).to eq 10
    end
  end
end
