# PRS is a game between 2 players. Both players pick a hand of either paper rock or scissors. then, the two hands are compared 
# and a winner is decided or if hands are the same it is a tie. p > r, r > s, s > p.
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

  attr_accessor :hand
  attr_reader :name

  def initialize(n)
    @name = n
  end

  def to_s
    "#{name} currently has a choice of #{self.hand.value}"
  end
end

class Human < Player
  def pick_hand
    begin
      puts "Pick one: (p, r, s):"
      c = gets.chomp.downcase
    end until Game::CHOICES.keys.include?(c)
    self.hand = (c)
  end
end

class Computer < Player
  def pick_hand
    self.hand = Game::CHOICES.keys.sample
  end
end


class Game
  CHOICES = {"p" => "Paper", "r" => "Rock", "s" => "Scissors"}
  attr_accessor :player, :computer

  def initialize
    @player = Human.new("Tom")
    @computer = Computer.new("R2D2")
  end

  def compare_hands
    if player.hand == computer.hand
      puts "It's a tie!"
    elsif player.hand > computer.hand
      puts "#{player.name} won!"
    else
      puts "#{computer.name} won!"
    end
  end

  def play
    player.pick_hand
    computer.pick_hand
    compare_hands
  end
end

game = Game.new.play
