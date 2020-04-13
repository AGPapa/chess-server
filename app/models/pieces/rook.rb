module Pieces
  class Rook < Piece
    def initialize(side:)
      super(:side => side, :type => "R")
    end

    def path_to_target(ply:)
      path = ([ply.start_row, ply.end_row].min..[ply.start_row, ply.end_row].max).flat_map do |row|
        ([ply.start_column, ply.end_column].min..[ply.start_column, ply.end_column].max).map do |column|
          OpenStruct.new(:row => row, :column => column)
        end
      end
      path[1..-2]
    end

    def can_move_to_target(ply:)
      (ply.start_row == ply.end_row) ^ (ply.start_column == ply.end_column)
    end
  end
end
