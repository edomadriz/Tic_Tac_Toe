require_relative 'Board.rb'
class Game
  attr_accessor :board, :player

  def initialize
    @board = Board.new
    @player = 1
  end

  def switchPlayer()
   if @player == 1
     @player = 2
   else
     @player = 1
   end
  end

  
  def startPlay
    p "WELCOME"
    playing = true
    while playing do
      posX, posY = 0
      if !@board.matrix.full?
        p "Player #{@player}"       
        posX = askForRow
        posY = askForCol
        if board.matrix.arrayPositionClear?(posX,posY)
          board.insertPlayMatrix(@player,posX,posY)
          p @board.printBoard
          if board.check_winner(@player)
            p "Winner is player #{@player}"
            p "CONGRATULATIONS"
            playing = newGame?
            p "WELCOME"
            @player = 2
            @board.matrix.clearArray
            @board.printBoard
          end
          switchPlayer
        else
          p "Position is already taken"
          p @board.printBoard
        end
      else
        p "Game tied, board is full"
        playing = newGame?
      end
    end
  end

   def isValidEntry?(number)
    return true if number < 3 && number >= 0
    return false
   end

   def askForRow
     while true do
       p "Write row position starting from 0"
       number = gets.to_i
       if isValidEntry?(number)
         return number
       else
         p "Invalid number, try again"
       end
     end
   end


   def askForCol
     while true do
       p "Write column position starting from 0"
       number = gets.to_i
       if isValidEntry?(number)
         return number
       else
         p "Invalid number, try again"
       end
     end
   end
    
   def newGame?
     p "For new game, enter 1"
     p "To quit enter 2"
     entry = gets.to_i
     return true if entry == 1
     return false
   end


end

game = Game.new
#game.entrada
p game.board.printBoard
game.startPlay
#p game.board.matrix
