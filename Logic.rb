module Logic
  extend self

  def one_to_two_arr_coordinates(one_d_pos)
    row = (one_d_pos / 3).floor(0)
    col = one_d_pos % 3

    [row, col]
  end

  def end_of_game_check(board)
    # Check rows then columns then then diagonal
    board.each_with_index do |row, index|
      return true if row.count('X') == 3 || row.count('O') == 3
    end

    for i in 0..2
      return true if board[0][i] == board[1][i] && board[0][i] == board[2][i]
    end
    false
    # still need to implement diagonal checks
  end
end
