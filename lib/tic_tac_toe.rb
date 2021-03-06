class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, player_token="X")
    @board[index] = player_token
  end

  def position_taken?(index)
     @board[index] != " "
  end

  def valid_move?(index)
  !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    count = 0
    @board.each do |move|
    if move == "X" or move == "O"
    count += 1
    end
    end
    count
  end

  def current_player
    if turn_count % 2 == 0
    "X"
  else
    "O"
    end
  end

def turn
  puts "Please enter a move 1-9"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else turn
  end
end

def won?
  WIN_COMBINATIONS.any? do |win_combo|
    if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
      return win_combo
    elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
      return win_combo
    else
    false
    end
  end
end

def full?
  !@board.any? {|position| position == " "}
  end

def draw?
  full? && !won?
end

def over?
draw? || won?
end

def winner
  if win_combo = won?
  return @board[win_combo[0]]
  end
end

def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
