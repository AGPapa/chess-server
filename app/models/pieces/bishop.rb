module Pieces
  class Bishop < Piece
    def initialize(side:)
      super(:side => side, :type => "B")
    end

    def path_to_target(ply:)
      path = (ply.start_row..ply.end_row).flat_map do |diff|
        [OpenStruct.new(:row => ply.start_row + diff, :column => ply.start_column + diff)]
      end
      path[1..-2]
    end

    def can_move_to_target(ply:)
      row_distance = (ply.end_row - ply.start_row).abs
      col_distance = (ply.end_column - ply.start_column).abs

      row_distance == col_distance && (row_distance != 0)
    end
  end
end
