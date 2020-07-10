module Pieces
  class Pawn < Piece
    def initialize(side:)
      super(:side => side, :type => "P")
    end

    def path_to_target(*)
      []
    end

    def can_move_to_target(ply:)
      # TODO: Implement captures

      row_distance = ply.end_row - ply.start_row
      col_distance = ply.end_column - ply.start_column

      if col_distance.zero? &&
         ((white? && ply.start_row == 6 && row_distance == -2) ||
         (black? && ply.start_row == 1 && row_distance == 2))
        return true # The pawn can move two spaces when beginning on its starting square
      end

      col_distance.zero? && ((row_distance == 1 && black?) || (row_distance == -1 && white?))
    end
  end
end
