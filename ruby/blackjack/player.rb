class Player
  attr_accessor :hand
  attr_reader   :role

  def initialize role:
    @role, @visible_cards = [], role
  end

  def hand_string
    "#{player.role} has:#{@hand.to_s}"
  end

  def check_hand_value

  end
end
