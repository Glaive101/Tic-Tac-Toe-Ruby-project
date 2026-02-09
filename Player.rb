class Player
  attr_accessor :piece_type

  def initialize
  end

  def get_player_piece_type
    # Determine user piece type
    puts 'As what piece do you want to play? X or O'
    @piece_type = gets.chomp

    @piece_type = @piece_type == 'X' || @piece_type == 'x' ? 'x' : 'o'
  end

  def player_position_choice
    puts 'Where would you like to place your piece?'
    gets.chomp
  end

  def get_player_column_position_choice
    puts 'Which column would you like to place your piece?'
    gets.chomp
  end

  def get_player_row_position_choice
    puts 'Which row would you like to place your piece?'
    gets.chomp
  end
end
