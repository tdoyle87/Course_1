#prs3.rb

CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}
puts "Do you want to play a game?"

def winning_choice(win)
  case win
  when 'p'
    puts "Paper is the king"
  when 'r'
    puts 'Rock destroyed its opponent'
  else 's'
    puts 'scissors severed paper'
  end
end
      

loop do
  
  begin puts "Please pick one (P,R,S)"
    player_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)

  computer_choice = CHOICES.keys.sample

  if player_choice == computer_choice
    puts "it's a tie"
  elsif (player_choice == 'p' && computer_choice == 'r') || (player_choice == 
    'r' && computer_choice == 's') || (player_choice == 's' && computer_choice == 'p')
    winning_choice(player_choice)
    puts "You won with #{player_choice} and computer lost with #{computer_choice}"
  else
    winning_choice(computer_choice)
    puts "Computer won with #{computer_choice} and you lost with #{player_choice}"
  end
  puts "do you want to play again? (Y/N)"
  user_input = gets.chomp.downcase
  if user_input != 'y'
    break
  end

end
