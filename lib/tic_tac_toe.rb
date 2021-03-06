def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]


def won?(board)
  all_match = false
  WIN_COMBINATIONS.each do |win_combo|

  if win_combo.all?{|win_index|board[win_index]=="X"} || win_combo.all?{|win_index|board[win_index]=="O"}
    all_match = win_combo
      end
  end
     all_match
end



  def full?(board)
    board.all? {|i| i == "X" || i == "O"}
  end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else won?(board)
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else return nil
  end
end
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, token)

  board[index] = token

end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
elsif !valid_move?(board,index)
  turn(board)
  end
end

def turn_count(board)
turn = 0
board.each do |space|
  if space == "X" || space =="O"
    turn += 1
  end
end
return turn
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end


def play(board)
  until over?(board)
turn(board)
  end
      if won?(board)
       puts "Congratulations #{winner(board)}!"
     elsif draw?(board)
       puts "Cat's Game!"

    end

end
