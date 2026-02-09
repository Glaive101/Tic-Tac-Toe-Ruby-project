class Computer
  attr_accessor :piece_type

  def get_computer_choice(game_arr)
    possible_moves_arr = determine_possible_moves(game_arr)
    score_arr = determine_score(game_arr, possible_moves_arr)
    determine_best_score_position(score_arr, possible_moves_arr)
  end

  def determine_best_score_position(score_arr, possible_moves_arr)
    max_index = 0
    score_arr.each_with_index do |value, index|
      max_index = index if value > score_arr[max_index]
    end
    max_index
    possible_moves_arr[max_index]
  end

  def determine_possible_moves(board)
    remaining_moves_arr = []
    board.each_with_index do |_, row|
      board.each_with_index do |_, col|
        remaining_moves_arr.append([row, col]) if board[row][col] == ' '
      end
    end
    # p remaining_moves_arr
    remaining_moves_arr
  end

  def determine_score(board, possible_moves_arr)
    score_arr = []

    possible_moves_arr.each_with_index do |position_pair, index|
      score = 0

      score += empty_row(board[position_pair[0]])
      score += empty_col(board, position_pair[1])
      score += fiendly_row(board[position_pair[0]])
      score += friendly_col(board, position_pair[1])

      score_arr.append(score.round(2))
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

  def fiendly_row(row_arr)
    row_arr.reduce(0) { |sum, item| item == @piece_type ? sum + 0.2 : sum }
  end

  def friendly_col(board, col_index)
    score = 0
    for i in 0..2 do
      score += 0.2 if board[i][col_index] == @piece_type
    end
    score
  end
end
