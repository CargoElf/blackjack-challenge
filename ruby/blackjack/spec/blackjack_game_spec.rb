require_relative '../blackjack_game'

RSpec.describe BlackjackGame do
  let(:blackjack_game) { BlackjackGame.instance }

  before do
    blackjack_game.reset_game
  end

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

    it 'winner is set to nil by default' do
      expect(blackjack_game.winner).to be nil
    end
  end

  context 'Methods' do
    describe '.check_blackjack' do
      it 'sets winner if blackjack' do
        allow(blackjack_game.player).to receive(:points).and_return 21

        blackjack_game.check_blackjack blackjack_game.player
        expect(blackjack_game.winner).to eq blackjack_game.player
      end

      it 'dose\'t set winner if not blackjack blackjack' do
        allow(blackjack_game.player).to receive(:points).and_return 20

        blackjack_game.check_blackjack blackjack_game.player
        expect(blackjack_game.winner).to eq nil
      end
    end

    describe '.bust?' do
      it 'returns true if player bust' do
        allow(blackjack_game.player).to receive(:points).and_return 22
        allow(blackjack_game.dealer).to receive(:points).and_return 17

        expect(blackjack_game.bust?).to be true
      end

      it 'returns true if dealer bust' do
        allow(blackjack_game.player).to receive(:points).and_return 2
        allow(blackjack_game.dealer).to receive(:points).and_return 25

        expect(blackjack_game.bust?).to be true
      end

      it 'returns false if neither card player busts' do
        allow(blackjack_game.player).to receive(:points).and_return 2
        allow(blackjack_game.dealer).to receive(:points).and_return 2

        expect(blackjack_game.bust?).to be false
      end
    end

    describe '.set_loser' do
      it 'sets winner to dealer if player loses' do
        blackjack_game.set_loser blackjack_game.player
        expect(blackjack_game.winner).to eq blackjack_game.dealer
      end

      it 'sets winner to player if dealer loses' do
        blackjack_game.set_loser blackjack_game.dealer
        expect(blackjack_game.winner).to eq blackjack_game.player
      end
    end

    describe '.set_winner' do
      it 'sets winner to player if player wins' do
        allow(blackjack_game.player).to receive(:points).and_return 20
        allow(blackjack_game.dealer).to receive(:points).and_return 17

        blackjack_game.set_winner
        expect(blackjack_game.winner).to eq blackjack_game.player
      end

      it 'winner to dealer if dealer wins' do
        allow(blackjack_game.player).to receive(:points).and_return 17
        allow(blackjack_game.dealer).to receive(:points).and_return 20

        blackjack_game.set_winner
        expect(blackjack_game.winner).to eq blackjack_game.dealer
      end

      it 'dosen\'t set winner if points are equal' do
        allow(blackjack_game.player).to receive(:points).and_return 17
        allow(blackjack_game.dealer).to receive(:points).and_return 17

        blackjack_game.set_winner
        expect(blackjack_game.winner).to eq nil
      end

      it 'returns if winner already set' do
        blackjack_game.set_loser blackjack_game.player
        expect(blackjack_game.set_winner).to eq nil
      end
    end

    describe '.declare_winner' do
      it 'returns player win string if winner player' do
        blackjack_game.set_loser blackjack_game.dealer
        expect(blackjack_game.declare_winner).to eq 'Player wins!'
      end

      it 'returns dealer win string if winner dealer' do
        blackjack_game.set_loser blackjack_game.player
        expect(blackjack_game.declare_winner).to eq 'Dealer wins!'
      end

      it 'returns push if winner isn\'t set' do
        expect(blackjack_game.declare_winner).to eq 'Push!'
      end
    end
  end
end
