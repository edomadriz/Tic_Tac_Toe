class Board
  attr_accessor :matrix
  def initialize
    @matrix = initialize_matrix
  end
  def insert_At(player, x, y)
    @matrix[x][y] = player
  end

  def full?
    !@matrix.flatten().include?(nil)
  end

  def clear_matrix
    @matrix = initialize_matrix
  end

  def position_available?(x, y)
    @matrix[x][y] == nil
  end

  def check_winner?(player)
      check_winner_row?(player) ||
      check_winner_col?(player) ||
      check_diagonal?(player) ||
      check_anti_diagonal?(player)
  end

 # private

  def initialize_matrix
    Array.new(3) {Array.new(3) { nil }}
  end

  def get_diagonal(ent1, ent2)
    [@matrix [0][ent1], @matrix[1][1], @matrix[2][ent2]]
  end

  def check_vector?(vector,player)
    vector.uniq.size == 1 && vector.uniq.first == player
  end

  def check_winner_row?(player)
    @matrix.each do |vector|
      return true if check_vector?(vector, player)
    end
    return false
  end

  def check_winner_col?(player)
    @matrix.transpose.each do|vector|
      return true if check_vector?(vector, player)
    end
    return false
  end

  def check_diagonal?(player)
    check_vector?(get_diagonal(0,2), player)
  end

  def check_anti_diagonal?(player)
    check_vector?(get_anti_diagonal(2,0), player)
  end

end
