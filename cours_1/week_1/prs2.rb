#prs2.rb

CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}
puts "Welcome to the fabulous game of Paper, Rock, SCisssoooorrrrs!!!!"

def winning_choice(winner)
  case winner
  when 'p'
    puts "Paper has encapsulated Rock"
  when 's'
    puts "Scissors have sliced and diced paper!"
  else
    puts 'Rock smashed the scissors'
  end
end

loop do
  begin puts "Pick one: (P, R, S)"
    player_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)

  computer_choice = CHOICES.keys.sample

  if player_choice == computer_choice
    puts "It has ended in a draw"

  elsif (player_choice == 'p' && computer_choice == 'r') || (player_choice == 'r' && computer_choice == 's') || (player_choice == 's' && computer_choice == 'p')
    winning_choice(player_choice)
    puts "You Won!! with #{player_choice} computer chose #{computer_choice}"
  else
    winning_choice(computer_choice)
    puts "Computer won with #{computer_choice} you chose #{player_choice}"
      
  end  
   puts "Do you want to play again? (Y/N)"
   play_again = gets.chomp.downcase
    if play_again != "y"
    break
    end
end