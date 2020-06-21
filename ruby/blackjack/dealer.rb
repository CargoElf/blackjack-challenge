class Dealer
  attr_accessor :hand

  def initialize
    @visible_cards = []
  end

  def show_visable_total
    @hand.each do |card|
      @visible_cards << card if card.visible
    end
  end

  def check_hand_value

  end
end
