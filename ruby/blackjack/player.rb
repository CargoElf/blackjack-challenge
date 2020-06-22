require_relative 'hand'

class Player
  attr_accessor :hand

  def initialize
    @hand = Hand.new
  end

  def hand_string
    "#{self.class.to_s} has:#{@hand.to_s}\nPoint Total: #{points}"
  end

  def points
    @hand.hand_total
  end
end
