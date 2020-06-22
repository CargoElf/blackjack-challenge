require_relative '../blackjack_game'

RSpec.describe BlackjackGame do
  let(:blackjack_game) { BlackjackGame.instance }

  describe '.attributes' do
    it 'has a player' do
      expect(blackjack_game.player).to be_instance_of Player
    end

    it 'has a dealer' do
      expect(blackjack_game.dealer).to be_instance_of Dealer
    end

    it 'has a deck' do
      expect(blackjack_game.deck).to be_instance_of Deck
    end
  end

  context 'Methods' do
    describe 'find_winner' do
      it 'returns Player wins! if player points higher' do
        allow(blackjack_game.player).to receive(:points).and_return 20
        allow(blackjack_game.dealer).to receive(:points).and_return 17

        expect(blackjack_game.find_winner).to eq 'Player wins!'
      end

      it 'returns Dealer wins! if dealer points higher' do
        allow(blackjack_game.player).to receive(:points).and_return 17
        allow(blackjack_game.dealer).to receive(:points).and_return 20

        expect(blackjack_game.find_winner).to eq 'Dealer wins!'
      end

      it 'returns Push! if point totals are equal' do
        allow(blackjack_game.player).to receive(:points).and_return 17
        allow(blackjack_game.dealer).to receive(:points).and_return 17

        expect(blackjack_game.find_winner).to eq 'Push!'
      end
    end
  end
end
