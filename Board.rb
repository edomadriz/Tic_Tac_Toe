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

  def insert_position(elem, posX, posY)
    @matrix[posX][posY] = elem
  end

  def full?
    !@matrix.flatten().include(0)
  end

  def clear_matrix
    @matrix = [
      [0,0,0],
      [0,0,0],
      [0,0,0]
    ]
  end

  def get_diagonal
    [@matrix [0][0], @matrix[1][1], @matrix[2][2]]
  end

  def get_anti_diagonal
    [@matrix[0][2], @matrix[1][1], @matrix[2][0]]
  end

  def matrix_position_clear?(posX, posY)
    @matrix[posX][posY] == 0
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
