module Pieces
  class King < Piece
    def initialize(side:)
      super(:side => side, :type => "K")
    end

    def path_to_target(*)
      []
    end

    def can_move_to_target(ply:)
      # TODO: Implement Castling
      row_distance = (ply.end_row - ply.start_row).abs
      col_distance = (ply.end_column - ply.start_column).abs
      [0, 1].include?(row_distance) && [0, 1].include?(col_distance) && [1, 2].include?(row_distance + col_distance)
    end
  end
end
