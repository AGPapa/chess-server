class Board
  include LocationInterpreter

  attr_reader :board, :is_white_turn

  def initialize
    @is_white_turn = true

    @board = Array.new(8) { Array.new(8) }
    @board.map!.with_index do |row, row_number|
      row.map!.with_index do |_square, col_number|
        side =
          if [6, 7].include?(row_number)
            "white"
          elsif [0, 1].include?(row_number)
            "black"
          else
            "empty"
          end

        if [1, 6].include?(row_number)
          Piece.new(:side => side, :type => "P")
        elsif [0, 7].exclude?(row_number)
          Piece.new(:side => side, :type => " ")
        elsif [0, 7].include?(col_number)
          Piece.new(:side => side, :type => "R")
        elsif [1, 6].include?(col_number)
          Piece.new(:side => side, :type => "N")
        elsif [2, 5].include?(col_number)
          Piece.new(:side => side, :type => "B")
        elsif col_number == 3
          Piece.new(:side => side, :type => "Q")
        elsif col_number == 4
          Piece.new(:side => side, :type => "K")
        end
      end
    end
  end

  def move(ply:)
    piece = board[ply.start_row][ply.start_column]
    if is_white_turn && !piece.white?
      return OpenStruct.new(:success? => false, :message => "Illegal ply - piece is non-white on white's turn")
    elsif !is_white_turn && !piece.black?
      return OpenStruct.new(:success? => false, :message => "Illegal ply - piece is non-black on black's turn")
    end

    board[ply.start_row][ply.end_column] = Piece.new(:side => "empty", :type => " ")
    board[ply.end_row][ply.end_column] = piece

    @is_white_turn = !is_white_turn

    OpenStruct.new(:success? => true, :message => "Ply #{ply.move} applied")
  end

  def pretty_print
    board_str = ""
    board.each_with_index do |row, row_number|
      board_str += to_external_rank(:row => row_number)
      row.each_with_index do |square, _col_number|
        board_str += " #{square.type}"
      end
      board_str += "\n"
    end
    board_str += " "
    (0...board.length).each { |index| board_str += " #{to_external_file(:column => index)}" }
    puts board_str
    board_str
  end
end
