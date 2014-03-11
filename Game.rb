require_relative 'Display.rb'
require_relative 'Board.rb'

class Game

  attr_reader :board, :player, :display

  def initialize
    @board = Board.new
    @display = Display.new
    @current_player = 0
  end

  def start
    display.start_game_message
    play_move while game_finished?
    check_finisher
  end

  private

  def play_move
    insert_move(display.get_player_move(get_player(@current_player), board.matrix))
  end

  def game_finished?
    check_for_winner? == true && check_for_tie? == true ? false : check_for_winner? == check_for_tie?
  end

  def insert_move(position)
    valid_entry?(position) && valid_entry_position?(position) ? board_insertion(position) : invalid_entry_number
  end

  def invalid_entry_number
    system 'clear'
    display.invalid_position
  end

  def valid_entry?(number)
    number < 10 && number > 0
  end

  def check_for_winner?
    @board.check_winner?(get_player(@current_player - 1))
  end

  def check_for_tie?
    @board.full?
  end

  def board_insertion(position)
    matrix_position = board.get_position(position)
    @board.insert_player_at(get_player(@current_player), matrix_position.first, matrix_position.last)
    @current_player = @current_player.succ
    system 'clear'
  end

  def check_finisher
    check_for_tie? ? declare_tie : declare_winner
  end

  def declare_tie
    display.game_tied(@board.matrix)
    exit
  end

  def declare_winner
    display.winner(get_player(@current_player - 1), @board.matrix)
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

  def get_player(player)
    player.even? ? "X" : "O"
  end

end
