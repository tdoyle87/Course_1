require 'pry'
#making a more ordered and better looking blackjack game

#class to set colors to text
class String
def black;          "\033[30m#{self}\033[0m" end
def red;            "\033[31m#{self}\033[0m" end
def green;          "\033[32m#{self}\033[0m" end
def brown;          "\033[33m#{self}\033[0m" end
def blue;           "\033[34m#{self}\033[0m" end
def magenta;        "\033[35m#{self}\033[0m" end
def cyan;           "\033[36m#{self}\033[0m" end
def gray;           "\033[37m#{self}\033[0m" end
def bg_black;       "\033[40m#{self}\033[0m" end
def bg_red;         "\033[41m#{self}\033[0m" end
def bg_green;       "\033[42m#{self}\033[0m" end
def bg_brown;       "\033[43m#{self}\033[0m" end
def bg_blue;        "\033[44m#{self}\033[0m" end
def bg_magenta;     "\033[45m#{self}\033[0m" end
def bg_cyan;        "\033[46m#{self}\033[0m" end
def bg_gray;        "\033[47m#{self}\033[0m" end
def bold;           "\033[1m#{self}\033[22m" end
def reverse_color;  "\033[7m#{self}\033[27m" end
end

# method to calculate total card value

def calculate_total(card)
  arr = card.map {|e| e[1]}

    total = 0
    arr.each do|value|
      if value == "A"
        total += 11
      elsif value.to_i == 0
        total += 10
      else 
        total += value.to_i
      end
    end

#ace logic
  arr.select{|e| e[1] == "A"}.count.times do
    total -= 10 if total > 21
  end

total
end


#makes deck of cards

suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = suits.product(cards)
deck.shuffle!
#begins main application
#first cards issued

puts "===== Welcome to Blackjack =====".center(75).bg_blue
puts "Please tell me what your name is"
user_name = gets.chomp.downcase.capitalize

  mycards = []
  dealercards = []
  puts "===== please wait while the dealer deals the cards =====".center(75).bg_blue  
  system 'clear'
  sleep(1)
  mycards << deck.pop
  dealercards << deck.pop
  mycards << deck.pop
  dealercards << deck.pop 

  #calculates totals for my cards and dealers cards
  my_total = calculate_total(mycards)
  dealer_total = calculate_total(dealercards) 
  

  puts "#{mycards[0]}".center(75)
  puts "#{mycards[1]}".center(75)
  puts "---------------".center(75)
  puts "#{user_name}: #{my_total}".bg_green.center(85)
  puts "".center(75)
  puts "".center(75)  

  puts "#{dealercards[0]}".center(75)
  puts "#{dealercards[1]}".center(75)
  puts "----------------".center(75)
  puts "Dealers Total: #{dealer_total}".bg_red.center(85)  

  #checks for player blackjack
  if my_total == 21
    system 'clear'
    puts "Congratulations #{user_name}! You have blackjack!!".bg_green.center(85)
    puts "#{user_name} your cards are".bg_green.center(85)
    puts "#{mycards[0]}".bg_green.center(85)
    puts "#{mycards[1]}".bg_green.center(85)
  end 

  #checks for dealer blackjack
  if dealer_total == 21
    system 'clear'
    puts "Sorry #{user_name} the dealer has blackjack. You lose".bg_red.center(85)
    puts "dealers cards are:".bg_red.center(85)
    puts "#{dealercards[0]}".bg_red.center(85)
    puts "#{dealercards[1]}".bg_red.center(85)
  end
   

  #player chooses hit or stay and totals
  loop do my_total < 21
    puts "#{user_name} what would you like to do".center(75)
    puts "1) Hit 2) Stay".center(75)
    hit_or_stay = gets.chomp.downcase
    if hit_or_stay == "1" || hit_or_stay == "hit"
      puts "Please wait while the dealer gives you a new card".center(75)
      mycards << deck.pop
      my_total = calculate_total(mycards)
      sleep(1)
      system 'clear'
      puts "#{mycards[0]}".center(75)
      puts "#{mycards[1]}".center(75)
      puts "#{mycards[2]}".center(75)
      puts "#{mycards[3]}".center(75)
      puts "#{mycards[4]}".center(75)
      puts "---------------".center(75)
      puts "#{user_name}: #{my_total}".bg_green.center(85)
      puts "".center(75)
      puts "".center(75)
      
      puts "#{dealercards[0]}".center(75)
      puts "#{dealercards[1]}".center(75)
      puts "----------------".center(75)
      puts "Dealers total: #{dealer_total}".bg_red.center(85)
      if my_total > 21
        puts "BUST"
        puts "The dealer wins with #{dealer_total}"
      end
    else hit_or_stay == "2"
      break
    end

#dealer decides to hit or stay
  dealer_total < 17
  dealercards << deck.pop 
  dealer_total = calculate_total(dealercards)
  break if dealer_total > 17 && my_total > 21
  #evaluating winner
  if my_total > dealer_total && my_total <= 21
    puts "#{user_name} you have won!".center(75)
    puts "#{mycards[0]}".center(75)
    puts "#{mycards[1]}".center(75)
    puts "#{mycards[2]}".center(75)
    puts "#{mycards[3]}".center(75)
    puts "#{mycards[4]}".center(75)
    puts "---------------".center(75)
    puts "#{user_name}: #{my_total}".bg_green.center(85)
  elsif my_total < dealer_total && dealer_total <= 21
    system 'clear'
    puts "Dealer has won".center(75)
    puts "#{dealercards[0]}".center(75)
    puts "#{dealercards[1]}".center(75)
    puts "#{dealercards[2]}".center(75)
    puts "#{dealercards[3]}".center(75)
    puts "#{dealercards[4]}".center(75)
    puts "----------------".center(75)
    puts "Dealers total: #{dealer_total}".bg_red.center(85)
  else my_total = dealer_total
    puts "its a tie".center(75)
    puts "in blackjack terms thats a push".center(75)
    system 'clear'
    puts "#{mycards[0]}".center(75)
    puts "#{mycards[1]}".center(75)
    puts "#{mycards[2]}".center(75)
    puts "#{mycards[3]}".center(75)
    puts "#{mycards[4]}".center(75)
    puts "---------------".center(75)
    puts "#{user_name}: #{my_total}".bg_green.center(85)
    puts "".center(75)
    puts "".center(75)
  
    puts "#{dealercards[0]}".center(75)
    puts "#{dealercards[1]}".center(75)
    puts "#{dealercards[2]}".center(75)
    puts "#{dealercards[3]}".center(75)
    puts "#{dealercards[4]}".center(75)
    puts "----------------".center(75)
    puts "Dealers total: #{dealer_total}".bg_red.center(85)
  end
    puts "Do you want to play again (Y/N)"
    play_again = gets.chomp.downcase
  break if play_again != "y"
  end
