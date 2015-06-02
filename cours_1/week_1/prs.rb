#prs.rb

CHOICES = {"p" => "Paper", 'r' => "Rock", "s" => "Scissors"}
puts "Welcome to Paper, Rock, Scissors"

loop do 
  begin
    puts "Pick one: (P, R, S):" 
    player_choice = gets.chomp.downcase
    end until CHOICES.keys.include?(player_choice)

    computer_choice = CHOICES.keys.sample

     if player_choice == computer_choice
      puts "It's a tie!"
      puts "Computer picked #{computer_choice} and player picked #{player_choice}"
    elsif player_choice == "p" && computer_choice == 'r'
      puts "Player wins!"
      puts "Computer picked #{computer_choice} and player picked #{player_choice}"
    elsif player_choice == 'r' && computer_choice == 'p'
      puts "Computer wins!"
      puts "Computer picked #{computer_choice} and player picked #{player_choice}"
    elsif player_choice == 's' && computer_choice == 'p'
      puts 'Player wins!'
      puts "Computer picked #{computer_choice} and player picked #{player_choice}"
    elsif player_choice == 'p' && computer_choice == 's'
      puts 'Computer wins!'
      puts "Computer picked #{computer_choice} and player picked #{player_choice}"
    elsif player_choice == 'r' && computer_choice == 's'
      puts 'Player wins!'
      puts "Computer picked #{computer_choice} and player picked #{player_choice}"
    elsif player_choice == 's' && computer_choice == 'r'
      puts "Computer wins!"
      puts "Computer picked #{computer_choice} and player picked #{player_choice}"
    else    

    end
    puts "Do you want to play again? (Y/N)"
    user_input = gets.chomp.downcase
    if user_input != "y"
      break
    end
  end