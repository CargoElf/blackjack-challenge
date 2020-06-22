require_relative '../player'
require_relative '../card'

RSpec.describe Player do

  describe '.attrubutes' do
    it 'is initialized with an hand object' do
      expect(Player.new.hand).to be_instance_of Hand
    end
  end

  context 'Methods' do
    let(:player)  { Player.new }
    let(:cards)   {
      [[:hearts, :ace, [11, 1]], [:hearts, :ten, 10]].map do |p|
        Card.new(p[0], p[1], p[2])
      end
    }

    before do
      player.hand.cards = cards
    end

    describe '.hand_string' do
      it 'prepends class name has: to front of string' do
        expect(player.hand_string).to match(/Player has:/)
      end
    end

    describe '.points' do
      it 'returns the number of points in the hand' do
        expect(player.points).to eq 21
      end
    end
  end

end
