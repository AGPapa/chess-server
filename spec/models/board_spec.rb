require "rails_helper"

RSpec.describe Board do
  describe ".initialize" do
    let(:board) { described_class.new }

    it "has the correct structure" do
      expect(board.board).to eql(
        [["R", "N", "B", "Q", "K", "B", "N", "R"],
         ["P", "P", "P", "P", "P", "P", "P", "P"],
         [" ", " ", " ", " ", " ", " ", " ", " "],
         [" ", " ", " ", " ", " ", " ", " ", " "],
         [" ", " ", " ", " ", " ", " ", " ", " "],
         [" ", " ", " ", " ", " ", " ", " ", " "],
         ["P", "P", "P", "P", "P", "P", "P", "P"],
         ["R", "N", "B", "Q", "K", "B", "N", "R"]]
      )
    end
  end

  describe ".move" do
    let(:board) { described_class.new }
    let(:ply) { Ply.new(:move => move) }

    context "when moving a pawn two spaces" do
      let(:move) { "e2e4" }

      it "has the correct structure" do
        board.move(:ply => ply)
        expect(board.board).to eql(
          [["R", "N", "B", "Q", "K", "B", "N", "R"],
           ["P", "P", "P", "P", "P", "P", "P", "P"],
           [" ", " ", " ", " ", " ", " ", " ", " "],
           [" ", " ", " ", " ", " ", " ", " ", " "],
           [" ", " ", " ", " ", "P", " ", " ", " "],
           [" ", " ", " ", " ", " ", " ", " ", " "],
           ["P", "P", "P", "P", " ", "P", "P", "P"],
           ["R", "N", "B", "Q", "K", "B", "N", "R"]]
        )
      end

      it "is now black's turn" do
        board.move(:ply => ply)
        expect(board.is_white_turn).to eql(false)
      end
    end
  end
end
