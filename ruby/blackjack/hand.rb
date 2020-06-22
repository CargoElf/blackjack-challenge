class Hand
  attr_accessor :cards
  CARD_EMOJIS = {
    diamonds: '♦️  DIAMONDS ♦️ ',
    hearts:   '❤️  HEARTS ❤️ ',
    spades:   '♠️  SPADES ♠️ ',
    clubs:    '♣️  CLUBS ♣️ '
  }

  def initialize
    @cards = []
  end

  def hand_total
    sorted_cards = @cards.sort { |a, b|  b.name <=> a.name }

    totaled_vals = sorted_cards.reduce(0) do |total, card|
      ace = card.name == :ace

      if ace && (total > 10)
        total += card.value.last
      elsif ace
        total += card.value.first
      else
        total += card.value
      end
    end

    totaled_vals
  end

  def to_s
    output_string = ''
    @cards.each do |card|
      card_info = "#{card.name.upcase} of #{CARD_EMOJIS[card.suit]}".center(26)
      output_string << "\n  - | #{card_info} |"
    end

    output_string
  end
end
