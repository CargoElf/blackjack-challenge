class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def hand_total
    @cards.sort! { |a, b|  b.name <=> a.name }

    totaled_cards = @cards.reduce(0) do |total, card|
      ace = card.name == :ace

      if ace && (total > 10)
        total += card.value.last
      elsif ace
        total += card.value.first
      else
        total += card.value
      end
    end

    totaled_cards
  end

  def to_s
    output_string = ''

    @cards.each do |card|
      output_string << "\n| #{card.name.upcase} of #{card.suit.upcase} |"
    end

    output_string
  end
end
