#TTT.rb

#starting my board
def starting_board_hash
  board = {}
  (1..9).each{|position| board[position] = " "}
  board
end

#drawing my board
def draw_board(board)
  system 'clear'
  puts "          |         |        "
  puts " #{board[1]}1       | #{board[2]}2      | #{board[3]}3"
  puts "          |         |        "
  puts " ----------------------------"
  puts "          |         |        "
  puts " #{board[4]}4       | #{board[5]}5      | #{board[6]}6"
  puts "          |         |        "
  puts " ----------------------------"
  puts "          |         |        "
  puts " #{board[7]}7       | #{board[8]}8      | #{board[9]}9"
  puts "          |         |        "
end
#defines what a empty space is
def empty_place(board)
  board.keys.select {|position| board[position] == " "}
end
#how a player picks
def player_places_piece(board)
  begin
  puts "pleas pick a spot to put your piece"
  puts "please enter 1-9"
  position = gets.chomp
  end until empty_place(board).include?(position)
b[position] = "X"
end


def computer_places_piece(board)
 postion = empty_place(board).sample
 board[position] = "O"
  end

def announce_winner
  puts "#{winner}"
end

def nine_squares_filled(board)
  empty_place(board) == []


board = starting_board_hash


draw_board(board)
player_places_piece(board)
computer_places_piece(board)
nine_squares_filled(board)
end