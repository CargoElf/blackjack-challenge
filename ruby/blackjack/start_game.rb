require_relative 'blackjack_game'

puts 'Blackjack: Ruby terminal Style'
puts 'Press enter to start'
gets.chomp

BlackjackGame.instance.run
