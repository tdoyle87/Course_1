class Hand
  include Comparable 
  attr_reader :value

  def inititalize(v)
    @value = v
  end

  def <=>(another_hand)
    if @value == another_hand.value
      0
    elsif (@value == "p" && another_hand.value == "r") || (@value == 'r' && another_hand.value == 's') || 
      (@value == 's' && another_hand.value == "p")
      1
    else
      -1
    end  
  end  
end

class Player
  include Comparable
  attr_reader :name
  attr_accessor :hand

  def initialize(n)
  @name = n
  end

  def to_s
    "#{name} currently has a choice of #{self.hand.value}"
  end
end

class Human < Player
  def players_hand
    begin puts "Pick one: (P, R, S)"
      player_hand = gets.chomp.downcase
    end until Game::CHOICES.keys.include?(player_hand)
    self.hand = player_hand
  end
end

class Computer < Player
  def computer_hand
  self.hand = Game::CHOICES.keys.sample
  end
end

class Game
  CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}
  attr_accessor :player, :computer

  def initialize
    @player = Human.new("tom")
    @computer = Computer.new("C3P0")
  end 

  def compare_hands
    if player.hand > computer.hand
      puts "#{player.name} you have won!"
    elsif player.hand < computer.hand
      puts "#{computer.name} has won :("
    else 
      puts "It is a tie!"
    end
  end 

  def play 
    player.players_hand
    computer.computer_hand
    compare_hands
  end
end

game = Game.new.play
