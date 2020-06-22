require_relative 'blackjack_game'
require_relative 'string_extensions'

puts 'Blackjack: '.cyan + 'Ruby '.red + 'Terminal Style'.cyan
puts "Press enter to start".magenta.blink
gets.chomp

BlackjackGame.instance.run
