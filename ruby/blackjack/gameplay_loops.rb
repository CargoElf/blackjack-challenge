module GameplayLoops
  def main_loop
    another_round = 'Y'

    while another_round == 'Y'
      game_round

      puts declare_winner
      reset_game

      puts "Would you like to play another_round? (y/n)"
      another_round = get_player_input
      line_break
    end
  end

  def game_round
    get_and_display_hand @player
    return if @winner
    line_break

    get_and_display_hand @dealer
    return if @winner

    player_turn_loop
    return if @winner

    dealer_turn_loop
    return if @winner

    find_winner
  end

  def player_turn_loop
    puts 'Would you like a card? (y/n)'
    hit = get_player_input

    while hit == 'Y'
      @player.hand.cards << @deck.deal_card
      puts @player.hand_string
      find_loser if bust?
      line_break
      break if @winner

      puts 'Would you like a card? (y/n)'
      hit = get_player_input
    end
  end

  def dealer_turn_loop
    while @dealer.hit?
      @dealer.hand.cards << @deck.deal_card
      puts @dealer.hand_string
      find_loser if bust?
      
      line_break
      break if @winner
    end
  end

  def get_and_display_hand card_player
    card_player.hand = Hand.new
    setup_hand card_player
    puts card_player.hand_string
    line_break
    check_blackjack card_player
  end

  def line_break
    puts "\n"
  end

  def get_player_input
    input = gets.chomp.to_s
    input += "\n"
    input[0].upcase
  end
end
