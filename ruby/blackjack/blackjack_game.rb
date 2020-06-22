%w( player dealer deck hand gameplay_loops ).each { |f| require_relative f }
require 'singleton'

class BlackjackGame
  include Singleton
  include GameplayLoops
  
  attr_reader :player, :dealer, :deck, :winner

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck   = Deck.new

    @player.hand = Hand.new
    @dealer.hand = Hand.new
  end

  def run
    main_loop
  end

  def check_blackjack card_player
    @winner = card_player if card_player.points == 21
  end

  def bust?
    @player.points > 21 || @dealer.points > 21
  end

  def set_loser card_player
    @winner = card_player.is_a?(Dealer) ? @player : @dealer
  end

  def set_winner
    return if @winner
    if @player.points > @dealer.points
      @winner = @player
    elsif @dealer.points > @player.points
      @winner = @dealer
    end
  end

  def declare_winner
    case @winner
    when @player
      'Player wins!'
    when @dealer
      'Dealer wins!'
    else
      'Push!'
    end
  end

  def reset_game
    @deck.shuffle
    @player.hand = Hand.new
    @dealer.hand = Hand.new
    @winner = nil
  end

  def setup_hand card_player
    2.times { card_player.hand.cards << @deck.deal_card }
  end
end
