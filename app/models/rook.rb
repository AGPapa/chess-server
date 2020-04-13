class Rook < Piece
  def path_to_target(start_row:, start_column:, end_row:, end_column:)
    path = (start_row..end_row).flat_map do |row|
      (start_column..end_column).flat_map do |column|
        [OpenStruct.new(:row => row, :column => column)]
      end
    end
    path.delete_at(0)
    path.delete_at(path.length - 1)
    path
  end

  def can_move_to_target(start_row:, start_column:, end_row:, end_column:)
    start_row == end_row ^ start_column == end_column
  end
end