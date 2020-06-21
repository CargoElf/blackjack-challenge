class Player
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def hand_string
    "#{self.class.to_s} has:#{@hand.to_s}"
  end

  def points
    @hand.hand_total
  end
end
