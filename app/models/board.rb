class Board
  include LocationInterpreter

  attr_reader :board, :is_white_turn

  def initialize
    @is_white_turn = true

    @board = Array.new(8) { Array.new(8) }
    @board.map!.with_index do |row, row_number|
      row.map!.with_index do |_square, col_number|
        if [1, 6].include?(row_number)
          "P"
        elsif [0, 7].exclude?(row_number)
          " "
        elsif [0, 7].include?(col_number)
          "R"
        elsif [1, 6].include?(col_number)
          "N"
        elsif [2, 5].include?(col_number)
          "B"
        elsif col_number == 3
          "Q"
        elsif col_number == 4
          "K"
        end
      end
    end
  end

  def move(ply:)
    @is_white_turn = !is_white_turn

    piece = board[ply.start_row][ply.start_column]
    board[ply.start_row][ply.end_column] = " "
    board[ply.end_row][ply.end_column] = piece
  end

  def pretty_print
    board_str = ""
    board.each_with_index do |row, row_number|
      board_str += to_external_rank(:row => row_number)
      row.each_with_index do |square, _col_number|
        board_str += " #{square}"
      end
      board_str += "\n"
    end
    board_str += " "
    (0...board.length).each { |index| board_str += " #{to_external_file(:column => index)}" }
    puts board_str
    board_str
  end
end
