class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def hand_total
    @cards.sort { |a, b| a.name <=> b.name }
    totaled_cards = @cards.reduce(0) do |total, card|
      total += card.value
      # if card.value ==
    end
    totaled_cards
  end
end
