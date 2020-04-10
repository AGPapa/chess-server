class Board

  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
    @board.map!.with_index do |row, row_number|
      row.map!.with_index do |square, col_number|
        if [1, 6].include?(row_number)
          square = "P"
        elsif [0, 7].exclude?(row_number)
          square = " "
        elsif [0, 7].include?(col_number)
          square = "R"
        elsif [1, 6].include?(col_number)
          square = "N"
        elsif [2, 5].include?(col_number)
          square = "B"
        elsif 3 == col_number
          square = "Q"
        elsif 4 == col_number
          square = "K"
        end
      end
    end
  end


  def pretty_print
    board_str = ""
    board.each_with_index do |row, row_number|
      board_str += _to_external_rank(:rank => row_number).to_s
      row.each_with_index do |square, col_number|
        board_str += " #{square}"
      end
      board_str += "\n"
    end
    board_str += " "
    (0...board.length).each { |index| board_str += " #{_to_external_file(:file => index)}" }
    puts board_str
    board_str
  end

  def _to_internal_rank(rank:)
    8 - rank
  end
 
  def _to_internal_file(file:)
    ("A".."Z").to_a.find_index(file.upcase) + 1
  end
  
  def _to_external_rank(rank:)
    _to_internal_rank(:rank => rank)
  end

  def _to_external_file(file:)
   ("A".."Z").to_a[file]
  end

end
