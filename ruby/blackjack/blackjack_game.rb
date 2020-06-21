require_relative 'player'
require_relative 'dealer'
require_relative 'deck'


class BlackjackGame
  attr_reader :player, :dealer, :deck

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck   = Deck.new

    @player.hand = Hand.new
    @dealer.hand = Hand.new
  end

  def deal_initial_cards
    @player.hand = [@deck.deal_card, @deck.deal_card]
    game_won(@player) if @player.has_21?

    @dealer.hand = [@deck.deal_card, @deck.deal_card]
    game_won(@dealer) if @dealer.has_21?
  end

  def find_winner
    if @player.points > @dealer.points
      'Player wins!'
    elsif @dealer.points > @player.points
      'Dealer wins!'
    else
      'Push!'
    end
  end

end

# require 'test/unit'
#
# class CardTest < Test::Unit::TestCase
#   def setup
#     @card = Card.new(:hearts, :ten, 10)
#   end
#
#   def test_card_suit_is_correct
#     assert_equal @card.suit, :hearts
#   end
#
#   def test_card_name_is_correct
#     assert_equal @card.name, :ten
#   end
#   def test_card_value_is_correct
#     assert_equal @card.value, 10
#   end
# end

# class DeckTest < Test::Unit::TestCase
#   def setup
#     @deck = Deck.new
#   end
#
#   def test_new_deck_has_52_playable_cards
#     assert_equal @deck.playable_cards.size, 52
#   end
#
#   def test_dealt_card_should_not_be_included_in_playable_cards
#     card = @deck.deal_card
#     assert(@deck.playable_cards.include?(card))
#   end
#
#   def test_shuffled_deck_has_52_playable_cards
#     @deck.shuffle
#     assert_equal @deck.playable_cards.size, 52
#   end
# end
