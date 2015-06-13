TTT_oop.rb

class Board
  WINNING_LINES =  [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

  def initialize
    @board = []
    (1..9).each {|position| @board[position] = square.new " "}
  end

  def empty_square
    @board.select {| , squares}

end

class Player

end

class Compute

end

class Game

end

game = Game.new.play