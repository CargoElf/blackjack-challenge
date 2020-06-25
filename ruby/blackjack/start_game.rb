require_relative 'lib/game_logic/blackjack_game'
require_relative 'lib/string_extensions/string_extensions'

puts 'Blackjack: '.cyan + 'Ruby '.red + 'Terminal Style'.cyan
puts "Press enter to start".magenta.blink
gets.chomp

BlackjackGame.instance.run
