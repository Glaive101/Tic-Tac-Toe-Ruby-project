# frozen_string_literal: true

require_relative 'DisplayBoard'
require_relative 'Player'
require_relative 'Computer'
require_relative 'Logic'

end_of_game = false

# Game variables
game_array = [['o', ' ', ' '], ['o', 'x', 'x'], [' ', 'x', ' ']]
game_board = DisplayBoard.new
player = Player.new
computer = Computer.new

# Startup information
start_arr = [%w[1 2 3],
             %w[4 5 6],
             %w[7 8 9]]

puts 'This is the board, when asked to place a piece, enter the corrosponding number.'
start_display = DisplayBoard.new
start_display.display(start_arr)

player.get_player_piece_type

computer.piece_type = player.piece_type == 'x' ? 'o' : 'x'
# computer_choice = computer.get_computer_choice(game_array)
# p computer_choice
# game_array[computer_choice[0]][computer_choice[1]] = computer.piece_type

# player_column_position_choice = player.get_player_column_position_choice.to_i - 1
# player_row_position_choice = player.get_player_row_position_choice.to_i - 1

until end_of_game == true
  player_position = player.player_position_choice.to_i - 1
  player_position_2d = Logic.one_to_two_arr_coordinates(player_position)
  game_array[player_position_2d[0]][player_position_2d[1]] = player.piece_type.upcase
  game_board.display(game_array)
  end_of_game = Logic.end_of_game_check(game_array)
end
