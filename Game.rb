require_relative 'Display.rb'
require_relative 'Board.rb'
class Game2

  attr_reader :board, :player, :display
  def initialize
    @board = Board.new
    @display = Display.new
    @current_player = "O"
  end

  def start
    display.start_game_message
    while game_finished?
      switch_player
      insert_move(display.get_player_move(@current_player, @board.matrix))
    end
    check_finisher
  end

  private

  def game_finished?
   check_for_winner? == true && check_for_tie? == true ? false : check_for_winner? == check_for_tie?
  end

  def insert_move(position)
    valid_entry?(position) && valid_entry_position?(position) ? board_insertion(position) : invalid_entry_number
  end

  def invalid_entry_number
    display.invalid_number
  end

  def valid_entry?(number)
    number < 10 && number > 0
  end

  def check_for_winner?
    @board.check_winner?(@current_player)
  end

  def check_for_tie?
    @board.full?
  end

  def board_insertion(position)
    matrix_position = board.get_position(position)
    @board.insert_at(@current_player, matrix_position.first, matrix_position.last)
  end

  def check_finisher
    check_for_tie? ? declare_tie : declare_winner
  end

  def declare_tie
    display.game_tied(@board.matrix)
    exit
  end

  def declare_winner
    display.winner(@current_player, @board.matrix)
    gets
    game_end
  end

  def game_end
    system 'clear'
    display.end_game(@board.matrix)
    exit
  end

  def valid_entry_position?(position)
    matrix_position = board.get_position(position)
    board.position_available?(matrix_position.first, matrix_position.last)
  end

  def switch_player
    @current_player == "X" ? @current_player = "O" : @current_player = "X"
  end
end
