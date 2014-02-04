require_relative 'Display.rb'
require_relative 'Board.rb'
class Game

  attr_accessor :board, :player
  attr_reader :display
  def initialize
    @board = Board.new
    @display = Display.new()
    @current_player = "X"
  end

  def start_game2
    display.start_game_message(@board.matrix)
    position = display.get_player_move(@current_player)
    position
    
  end

  def start_game
    display.welcome_message
    option = display.show_options_main_menu
    case option 
    when 1 
      system 'clear'
      display.print_board
      play
    when 2 
      display.end_game
    end
  end

  def play
    while !@board.full?
      display.current_player
      option = display.show_options_ingame_menu
      case option
      when 1
        player_make_play
      when 2
       start_game
      when 3
        display.end_game
        exit
      else
        display.invalid_number
      end

    end
    display.game_tied
    @board.clear_matrix
    @player = 1
    gets
    start_game
  end

  private 

  def switch_player()
   @current_player == "X" ? @current_player = "O" : @current_player = "X"
  end
end
