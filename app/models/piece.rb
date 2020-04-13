class Piece
  attr_reader :side

  def initialize(side:)
    raise "Invalid side" if ["white", "black", "empty"].exclude?(side)

    @side = side
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
