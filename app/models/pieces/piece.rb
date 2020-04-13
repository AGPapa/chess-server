module Pieces
  class Piece
    attr_reader :side, :type

    def initialize(side:, type:)
      raise "Invalid side" if ["white", "black", "empty"].exclude?(side)

      @side = side
      @type = type
    end

    def white?
      side == "white"
    end

    def black?
      side == "black"
    end

    def empty?
      side == "empty"
    end
  end
end
