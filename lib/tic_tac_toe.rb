require 'pry'
class TicTacToe

 def initialize
   @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
 end


 WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def input_to_index (user_input)
  user_input.to_i - 1
end

def move (index, token = "X")
  @board[index] = token
end

def position_taken?(index)
  if  @board[index] == " "
  false
  else
  true
  end
end

def valid_move?(index)
  if !self.position_taken?(index) && (0..8).to_a.include?(index)
  true
  else
  false
  end
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count.even? ? "X":"O"
end

def turn
 var = gets
 index = self.input_to_index(var)


 if valid_move?(index)
   token = current_player
   move(index, token)
 else
   gets
 end

 self.display_board
end

def won?
cross = []
circle = []

  @board.collect.with_index do |position, index|
    if position = "X"
      cross << index
    elsif postion = "O"
      circle << index
    else
      nil
    end

  end
binding.pry
  if WIN_COMBINATIONS.find {|array| array.all? {|i| cross.include?(i)}}
    WIN_COMBINATIONS.find {|array| array.all? {|i| cross.include?(i)}}
  elsif WIN_COMBINATIONS.find {|array| array.all? {|i| circle.include?(i)}}
    WIN_COMBINATIONS.find {|array| array.all? {|i| circle.include?(i)}}
  else
    false
  end

#if [1, 2, 3].all? { |i| (1..9).include?(i) }
#["X", "O", "X", "O", "X", "X", "O", "X", "O"]
end

end
