class Dealer
  attr_reader :hand

  def initialize
  end

  def show_visable_cards
    @hand.each do |c|
      puts "#{c.name} of #{c.suit}" if c.visible
    end
  end

  def check_hand_value
    
  end
end
