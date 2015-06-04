 #makes has for the board
def initialize_board
  b = {}
  (1..9).each{|position| b[position] = " "}
  b
end

 #draws board and refreshes after every complete turn 
def draw_board(b)
  system 'clear'
  puts "          |         |        "
  puts " #{b[1]}        | #{b[2]}       | #{b[3]}"
  puts "          |         |        "
  puts " ----------------------------"
  puts "          |         |        "
  puts " #{b[4]}        | #{b[5]}       | #{b[6]}"
  puts "          |         |        "
  puts " ----------------------------"
  puts "          |         |        "
  puts " #{b[7]}        | #{b[8]}       | #{b[9]}"
  puts "          |         |        "
end

#defines a empty square
def empty_square(b)
  b.keys.select{|position| b[position] == " "}
end

#user picks a square
def player_puts_X(b)
  begin
  puts "Pick a square (1 - 9)"
  position = gets.chomp.to_i
end until empty_square(b).include?(position)
  b[position] = "X"
end

#computer picks a square
def computer_puts_O(b)
    position = empty_square(b).sample
   if block_winning_lines(b)
    b[position] = "O"
  elsif two_in_a_row(b, "X")
    b[position] = "O"
  else
    position = empty_square(b).sample
    b[position] = "O"
  end 
end

#ai for computer
  def two_in_a_row(b, x)
  if b.values.count(x) == 2
    b.select{|k,v| v == " "}.keys.first
  else
    false
  end
end
#shot at additional ai for computer
def block_winning_lines(b)
   winning_lines = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  winning_lines.each do |line|
    if b.values_at(*line).count("X") == 2
      b.select{|k,v| v == " "}.keys.first
    end
  end
end

#calculates if there is a winner
def find_winner(b)
  winning_lines = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  winning_lines.each do |line|
    return "Player" if b.values_at(*line).count("X") == 3
    return "Computer" if b.values_at(*line).count("O") == 3
  end
  nil
end

#says who the winner is
def announce_winner(winner)
  puts "#{winner} won!"
end

#stops game if all squares taken
def nine_squares_filled(b)
  empty_square(b) == []
end


#makes board equal to initialize_board method
board = initialize_board
  begin
    draw_board(board)
    puts "Lets play Tic Tac Toe"
    player_puts_X(board)
    computer_puts_O(board)
    winner = find_winner(board)
  end until winner || nine_squares_filled(board) #ends when one of these conditions is meet
    if winner
      announce_winner(winner)
    else
      puts "It's a tie"
    end
