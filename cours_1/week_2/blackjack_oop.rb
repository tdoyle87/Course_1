class Card
  attr_accessor :suit, :face_value

  def initialize(suit, face_value)
    @suit = suit
    @face_value = face_value
  end

  def output_style
   "#{face_value} of #{suit_type}"
  end

  def to_s
    output_style
  end

  def suit_type
    ret_value = case suit
                  when "H" then "Hearts"
                  when "D" then "Diamonds"
                  when "S" then "Spades"
                  when "C" then "Clubs"
                end
    ret_value
  end
end

class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    ["H", "D", "S", "C"].each do |suit|
      ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"].each do |face_value|
        @cards << Card.new(suit, face_value)
      end
    end
  scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal_one
    cards.pop
  end
end

module Hand

  def show_flop
    puts "---- #{name} ----"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
  end

  def total
    face_values = cards.map{|card| card.face_value }

    total = 0
    face_values.each do |val|
      if val == "A"
        total += 11
      else
        total += (val.to_i == 0 ? 10 : val.to_i)
      end
    end

    #correct for Aces
    face_values.select{|val| val == "A"}.count.times do
      break if total <= 21
      total -= 10
    end
    total
  end

  def add_card(new_card)
    cards << new_card
  end

  def busted?
    total > 21
  end
end

class Player
  attr_accessor :cards, :name
  
  include Hand

  def initialize(name)
    @name = name
    @cards = []
  end
end

class Dealer
  attr_accessor :cards
  attr_reader :name
  
  include Hand

  def initialize
    @name = "Dealer"
    @cards = []
  end

  def show_flop
      puts "---- #{name} ----"
      puts "=> card hidden"
      puts "=> #{cards[1]}"
    puts "=> Total: ??"
  end

  def reveal
    puts "---- #{name} ----"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
  end
end

class BlackJack
  attr_accessor :deck, :player, :dealer

  BlACKJACK_AMOUNT = 21
  DEALER_HIT_MIN = 17
  
  def initialize
    @deck = Deck.new
    @player = Player.new("Player1")
    @dealer = Dealer.new
  end

  def players_name
    puts "What is your name?"
    player.name = gets.chomp
  end

  def initial_deal
    player.add_card(deck.deal_one)
    dealer.add_card(deck.deal_one)
    player.add_card(deck.deal_one)
    dealer.add_card(deck.deal_one)
  end

  def show_flop
    player.show_flop
    dealer.show_flop
  end

  def winning_blackjack?
    if player.total == BlACKJACK_AMOUNT
      puts "#{player.name} you Win! You have Blackjack!!"
      play_again?
    elsif dealer.total == BlACKJACK_AMOUNT
      puts "#{dealer.name} wins because he has blackjack"
      dealer.reveal
      play_again?
    end
  end

  def player_bust?
    if player.busted?
      puts "Sorry #{player.name} you busted"
      play_again?
    end
  end
  
  def dealer_bust?
    if dealer.busted?
      puts "Congratulations #{player.name} the dealer has busted you win!!" 
      play_again?
    end
  end
    

  def players_turn
    winning_blackjack?
    while player.total < BlACKJACK_AMOUNT
      puts "#{player.name} would you like to 1) Hit or 2) Stay" 
      hit_or_stay = gets.chomp
      
      if !["1", "2"].include?(hit_or_stay)
        puts "ERROR: input must be 1 or 2"
      elsif hit_or_stay == "2"
        puts "#{show_flop}!"
        break
      else hit_or_stay == "1"
        player.add_card(deck.deal_one)
        player.total
        player.show_flop
        if player.total > BlACKJACK_AMOUNT
          break
        end
      end  
    end
  end

  def dealers_turn
    while dealer.total  < DEALER_HIT_MIN
      dealer.add_card(deck.deal_one)
      dealer.total
      if dealer.total > DEALER_HIT_MIN
        dealer.reveal
      elsif dealer.total > BlACKJACK_AMOUNT
        break
      end
    end
  end

  def play_again?
    puts "Do you want to play again (Y/N)?"
    play_again_choice = gets.chomp.downcase
    if play_again_choice == "y"
      puts ""
      puts "Starting new game"
      puts ""
      deck = Deck.new
      player.cards = []
      dealer.cards =[]
      start
    else
      puts "Goodbye"
      exit
    end
  end

  def winner?
    if player.total > dealer.total
      puts "Congratulations #{player.name} you have #{player.total} you win! Dealer has #{dealer.total}"
    elsif dealer.total > player.total
      puts "#{dealer.reveal}Sorry #{player.name} the Dealer has #{dealer.total} you lose."
    else 
      puts "#{player.show_flop} #{dealer.reveal} Push"
    end
    play_again?
  end


  def start
    players_name
    initial_deal
    show_flop
    players_turn
    player_bust?
    dealers_turn
    dealer_bust?
    winner?
  end
end


BlackJack.new.start