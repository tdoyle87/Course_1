
CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}

def say(msg)
puts "___________ msg ___________"
end


def players_choice
  begin
  puts "Please pick R,P,S"
  input = gets.chomp.downcase
    if input != CHOICES.keys
      puts "You picked #{input}"
    end
end until CHOICES.include?(input)
end

def computers_choice
  choice = CHOICES.keys.sample
  puts " Computer picked #{choice}"
end

def winner
  if (players_choice == "r" && computers_choice == "s") || (players_choice == "p" && computers_choice == "r") || (players_choice == "s" && computers_choice =="p")
    puts 'You have won'
  else
    puts "The computer has won"
  end
end


puts "Welcome to Rock, Paper, Scissors"
players_choice
computers_choice
if players_choice == "r" && computers_choice == "s" || players_choice == "p" && computers_choice == "r" || players_choice == "s" && computers_choice =="p"
    puts 'You have won'
  else
    puts "The computer has won"
  end