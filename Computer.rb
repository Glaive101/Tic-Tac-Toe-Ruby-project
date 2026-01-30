class Computer
  attr_accessor :piece_type

  def get_computer_choice(game_arr)
    p determine_score(game_arr, determine_possible_moves(game_arr))
  end

  def determine_possible_moves(board)
    remaining_moves_arr = []
    board.each_with_index do |_, row|
      board.each_with_index do |_, col|
        remaining_moves_arr.append([row, col]) if board[row][col] == ' '
      end
    end
    remaining_moves_arr
  end

  def determine_score(board, possible_moves_arr)
    score_arr = []

    possible_moves_arr.each_with_index do |position_pair, index|
      score = 0

      score += empty_row(board[position_pair[0]])
      score += empty_col(board, position_pair[1])

      score_arr.append(score)
    end

    score_arr
  end

  def empty_row(row_arr)
    row_arr.reduce(0) { |sum, item| item == ' ' ? sum + 0.1 : sum }
  end

  def empty_col(board, col_index)
    score = 0
    for i in 0..2 do
      score += 0.1 if board[i][col_index] == ' '
    end
    score
  end
end
