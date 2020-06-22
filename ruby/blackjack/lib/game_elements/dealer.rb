require_relative 'player'

class Dealer < Player
  def hit?
    points < 17
  end
end
