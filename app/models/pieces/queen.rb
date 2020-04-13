module Pieces
  class Queen < Piece
    def initialize(side:)
      super(:side => side, :type => "Q")
    end

    def path_to_target(ply:)
      bishop = Bishop.new(:side => side)
      rook = Rook.new(:side => side)

      if bishop.can_move_to_target(:ply => ply)
        bishop.path_to_target(:ply => ply)
      elsif rook.can_move_to_target(:ply => ply)
        rook.path_to_target(:ply => ply)
      else
        []
      end
    end

    def can_move_to_target(ply:)
      bishop = Bishop.new(:side => side)
      rook = Rook.new(:side => side)

      bishop.can_move_to_target(:ply => ply) || rook.can_move_to_target(:ply => ply)
    end
  end
end
