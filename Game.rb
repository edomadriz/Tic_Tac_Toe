require_relative 'Display.rb'
require_relative 'Board.rb'
class Game

  attr_reader :board, :player, :display
  def initialize
    @board = Board.new
    @display = Display.new
    @current_player = "X"
  end

  def start_game
    display.start_game_message(@board.matrix)
    insert_move(display.get_player_move(@current_player, @board.matrix))
  end

  private

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
    get_move(display.get_player_move(@current_player, @board.matrix))
  end

  def board_insertion(position)
    matrix_position = board.get_position(position)
    @board.insert_at(@current_player, matrix_position.first, matrix_position.last)
    check_for_winner
    check_for_tie
  end

  def check_for_winner
    if @board.check_winner?(@current_player)
     display.winner(@current_player, @board.matrix)
     gets
     game_end
    end
  end

  def game_end
    system 'clear'
    display.end_game(@board.matrix)
    exit
  end

  def check_for_tie
    @board.full? ? display.game_tied(@board.matrix) : next_move
  end

  def next_move
    system 'clear'
    switch_player
    insert_move(display.get_player_move(@current_player, @board.matrix))
  end

  def valid_entry_position?(position)
    matrix_position = board.get_position(position)
    board.position_available?(matrix_position.first, matrix_position.last)
  end

  def valid_entry?(number)
    number < 10 && number > 0
  end

  def switch_player
   @current_player == "X" ? @current_player = "O" : @current_player = "X"
  end
end
