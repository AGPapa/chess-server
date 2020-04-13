module Pieces
  class Knight < Piece
    def initialize(side:)
      super(:side => side, :type => "N")
    end

    def path_to_target(*)
      []
    end

    def can_move_to_target(ply:)
      row_distance = (ply.end_row - ply.start_row).abs
      col_distance = (ply.end_column - ply.start_column).abs
      (row_distance == 2 && col_distance == 1) || (row_distance == 1 && col_distance == 2)
    end
  end
end
