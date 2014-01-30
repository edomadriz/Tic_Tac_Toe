class Board
  attr_accessor :matrix
  def initialize
    @matrix = [
      [0,0,0],
      [0,0,0],
      [0,0,0]
    ]
  end

  def insert_position_matrix(player, positionX, positionY)
    @matrix[positionX][positionY] = player
  end

  def full?
    !@matrix.flatten().include?(0)
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

  def matrix_position_clear?(positionX, positionY)
    @matrix[positionX][positionY] == 0
  end

  def check_vector?(vector,player)
    vector.uniq.size == 1 && vector.uniq.first == player
  end

  def check_winner_row?(player)
    @matrix.each {|vector|
       return true if check_vector?(vector, player)}
    return false
  end

  def check_winner_col?(player)
    @matrix.transpose.each {|vector|
        return true if check_vector?(vector, player)}
    return false
  end

  def check_diagonal?(player)
    check_vector?(get_diagonal, player)
  end

  def check_anti_diagonal?(player)
    check_vector?(get_anti_diagonal, player)
  end

  def check_winner?(player)
      check_winner_row?(player) ||
      check_winner_col?(player) ||
      check_diagonal?(player) ||
      check_anti_diagonal?(player)
  end

end
