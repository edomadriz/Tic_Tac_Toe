require_relative 'Display.rb'
require_relative 'Board.rb'
class Game

  attr_accessor :board, :player
  attr_reader :display
  def initialize
    @board = Board.new
    @display = Display.new
    @current_player = "X"
  end

  def start_game
    display.start_game_message(@board.matrix)
    insert_move(display.get_player_move(@current_player))
  end

  def get_move(move)
     valid_entry?(move) ? insert_move(move) : invalid_entry_number
  end

  def invalid_entry_number
    display.invalid_number
    get_move(display.get_player_move(@current_player))
  end

  def insert_move(position)
  valid_entry_position?(position) ? board_insertion(position) : invalid_entry_position
  end

  def invalid_entry_position
    display.invalid_position
    get_move(display.get_player_move(@current_player))
  end

  def board_insertion(position)
    matrix_position = board.get_position_in_matrix(position)
    @board.insert_At(@current_player, matrix_position.first, matrix_position.last)
    display.print_board(@board.matrix)
  end

  def valid_entry_position?(position)
    matrix_position = board.get_position_in_matrix(position)
    board.position_available?(matrix_position.first, matrix_position.last)
  end

  def valid_entry?(number)
    number < 10 && number > 0
  end

  def switch_player
   @current_player == "X" ? @current_player = "O" : @current_player = "X"
  end
end
