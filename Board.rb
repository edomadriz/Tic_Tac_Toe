require_relative 'MultiArray.rb'
class Board
  #Atributes
  attr_accessor :matrix
  #Initializer
  def initialize
    @matrix = [
      [0,0,0],
      [0,0,0],
      [0,0,0]
    ]
  end

  def insert_Position(elem, posX, posY)
    @matrix[posX][posY] = elem
  end

  

  def check_vector?(vector,player)
    vector.uniq.size == 1 && vector.uniq.first == player
  end

  def check_winner_row?(player)
    @matrix.array.each {|vector|
       return true if check_vector(vector, player)}
    return false
  end

  def check_winner_col?(player)
    @matrix.array.transpose.each {|vector|
        return true if check_vector(vector, player)}
    return false
  end

  def check_diagonal?(player)
    check_vector(@matrix.getDiagonal, player)
  end

  def check_anti_diagonal?(player)
    check_vector(@matrix.getAntiDiagonal, player)
  end

  def check_winner?(player)
      check_winner_row(player) ||
      check_winner_col(player) ||
      check_diagonal(player) ||
      check_anti_diagonal(player)
  end

  def insertPlayMatrix(player, posX, posY)
    if player == 1
      @matrix.insertPos(1,posX, posY)
    else
      @matrix.insertPos(2,posX, posY)
    end
  end

  def printBoard
    p "-------"
    @matrix.array.each do |vector|
      p vector
    end
    return "-------"
  end


end
