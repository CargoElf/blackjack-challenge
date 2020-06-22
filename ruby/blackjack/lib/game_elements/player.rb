require_relative 'hand'

class Player
  attr_accessor :hand

  def initialize
    @hand = Hand.new
  end

  def hand_string
    output = "#{self.class.to_s} has:".cyan
    output << "#{@hand.to_s}\n".center(14)
    output << "Point Total: #{points}".magenta
  end

  def points
    @hand.hand_total
  end
end
