# Gets array of current board state an appended human & computer choice
class DisplayBoard
  def initialize
  end

  def display(piece_arr)
    print "#{piece_arr[0][0]} | #{piece_arr[0][1]} | #{piece_arr[0][2]}\n--+---+--\n"
    print "#{piece_arr[1][0]} | #{piece_arr[1][1]} | #{piece_arr[1][2]}\n--+---+--\n"
    print "#{piece_arr[2][0]} | #{piece_arr[2][1]} | #{piece_arr[2][2]}\n"
  end
end
