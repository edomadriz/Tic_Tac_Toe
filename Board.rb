class Board
  attr_accessor :matrix
  def initialize
    @matrix = initialize_matrix
  end
  def insert_at(player, x, y)
    @matrix[x][y] = player
  end

  def full?
    !matrix.flatten().include?(" ")
  end

  def clear_matrix
    @matrix = initialize_matrix
  end

  def position_available?(x, y)
    @matrix[x][y] == " "
  end

  def check_winner?(player)
      check_winner_row?(player) || check_winner_col?(player) ||
      check_diagonal?(player)
  end

  def get_position(number)
    [] << (number - 1)/3 << (number - 1)%3
  end

 private

  def initialize_matrix
    Array.new(3) {Array.new(3) {" "}}
  end

  def get_diagonal(ent1, ent2)
    [matrix[0][ent1], matrix[1][1], matrix[2][ent2]]
  end

  def check_vector?(vector,player)
    vector.uniq.size == 1 && vector.uniq.first == player
  end

  def check_winner_row?(player)
    result = matrix.map {|vector| check_vector?(vector, player)}
    result.include?(true)
  end

  def check_winner_col?(player)
    result = matrix.transpose.map {|vector| check_vector?(vector, player)}
    result.include?(true)
  end

  def check_diagonal?(player)
    check_vector?(get_diagonal(2,0), player) || check_vector?(get_diagonal(0,2),player)
  end
end
