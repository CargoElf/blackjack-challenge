class Card
  attr_accessor :suit, :name, :value, :visible

  def initialize(suit, name, value)
    @suit, @name, @value = suit, name, value
  end
end
