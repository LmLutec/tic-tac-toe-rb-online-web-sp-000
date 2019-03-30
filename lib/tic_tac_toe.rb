require 'pry'
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [0, 3, 6],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
  [6, 7, 8],
  [1, 4, 7]
  
  ]

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
  
  def move(board, position, player)
    board[position] = player 
  end 
  
  def position_taken?(board, index)
   board[index] != " "
  end   
  
  def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
  end 
    
   def turn(board)
      puts "Please enter 1-9:"
       input = gets.strip 
       index = input_to_index(input)
       if valid_move?(board,index)
          move(board, index, current_player(board))
          display_board(board)
       else 
         turn(board)
       end
  end  
  
  def turn_count(board)
        count = 0 
      board.each do |index|
      if index == "X" || index == "O"
      count = count + 1 
           end 
      end 
      count 
  end 
    
  def current_player(board)
    if turn_count(board).even?
      return "X" 
    else 
      return "O" 
    end
  end 
    
  def won?(board)
      WIN_COMBINATIONS.detect do |combo|
          board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
        end 
  end 
  
  def full?(board)
      board.all? {|index| index == "X" || index=="O"}
    end 
  
  def draw?(board)
    full?(board) && !won?(board)
  end 
 
  def over?(board)
    draw?(board) || won?(board)
  end
    
  def winner(board)
    if !won?(board)
        nil 
      else
      board[won?(board)[0]]
    end 
  end   

  def play(board) 
       while !over?(board)
        turn(board) 
       end 
      
       if won?(board)
         puts "Congratulations #{winner(board)}!"
       else 
            puts "Cat's Game!"
            
       end
    end
    
