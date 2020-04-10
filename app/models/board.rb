class Board

  def initialize
    board = Array.new(8) { Array.new(8) }
    board.each_with_index do |row, row_number|
      row.each_with_index do |square, col_number|
        if [1, 6].include?(row_number)
          board[row_number][col_number] = "p"
        elsif [0, 7].exclude?(row_number)
          board[row_number][col_number] = ""
        elsif [0, 7].include?(col_number)
          board[row_number][col_number] = "R"
        elsif [1, 6].include?(col_number)
          board[row_number][col_number] = "N"
        elsif [2, 5].include?(col_number)
          board[row_number][col_number] = "B"
        elsif 3 == col_number
          board[row_number][col_number] = "Q"
        elsif 4 == col_number
          board[row_number][col_number] = "K"
        end
      end
    end
  end
end
