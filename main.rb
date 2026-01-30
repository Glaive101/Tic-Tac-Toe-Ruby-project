# frozen_string_literal: true

require_relative 'DisplayBoard'
require_relative 'Player'
require_relative 'Computer'

# Game variables
game_array = [[' ', ' ', ' '], [' ', 'X', ' '], [' ', ' ', ' ']]
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
computer.get_computer_choice(game_array)

player_column_position_choice = player.get_player_column_position_choice.to_i - 1
player_row_position_choice = player.get_player_row_position_choice.to_i - 1

game_array[player_row_position_choice][player_column_position_choice] = player.piece_type.upcase
# game_board.display(game_array)
