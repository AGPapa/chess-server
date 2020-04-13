require "rails_helper"

RSpec.describe Board do
  STARTING_BOARD =
    [["R", "N", "B", "Q", "K", "B", "N", "R"],
     ["P", "P", "P", "P", "P", "P", "P", "P"],
     [" ", " ", " ", " ", " ", " ", " ", " "],
     [" ", " ", " ", " ", " ", " ", " ", " "],
     [" ", " ", " ", " ", " ", " ", " ", " "],
     [" ", " ", " ", " ", " ", " ", " ", " "],
     ["P", "P", "P", "P", "P", "P", "P", "P"],
     ["R", "N", "B", "Q", "K", "B", "N", "R"]].freeze

  let(:mapped_board) { board.board.map { |row| row.map(&:type) } }

  describe ".initialize" do
    let(:board) { described_class.new }

    it "has the correct structure" do
      expect(mapped_board).to eql(STARTING_BOARD)
    end
  end

  describe ".move" do
    let(:board) { described_class.new }
    let(:ply) { Ply.new(:move => move) }

    context "when it is white's turn" do
      context "when given a valid move for a white piece" do
        let(:move) { "e2e3" }

        it "returns success" do
          expect(board.move(:ply => ply).success?).to eql(true)
        end

        it "moves the pawn" do
          board.move(:ply => ply)
          expect(mapped_board).to eql(
            [["R", "N", "B", "Q", "K", "B", "N", "R"],
             ["P", "P", "P", "P", "P", "P", "P", "P"],
             [" ", " ", " ", " ", " ", " ", " ", " "],
             [" ", " ", " ", " ", " ", " ", " ", " "],
             [" ", " ", " ", " ", " ", " ", " ", " "],
             [" ", " ", " ", " ", "P", " ", " ", " "],
             ["P", "P", "P", "P", " ", "P", "P", "P"],
             ["R", "N", "B", "Q", "K", "B", "N", "R"]]
          )
        end

        it "is now black's turn" do
          board.move(:ply => ply)
          expect(board.is_white_turn).to eql(false)
        end
      end

      context "when moving a piece into another of its own color" do
        let(:move) { "a1a2" }

        it "returns failure" do
          expect(board.move(:ply => ply).success?).to eql(false)
        end

        it "does not move any piece" do
          board.move(:ply => ply)
          expect(mapped_board).to eql(STARTING_BOARD)
        end

        it "is still white's turn" do
          board.move(:ply => ply)
          expect(board.is_white_turn).to eql(true)
        end
      end

      context "when moving an empty piece" do
        let(:move) { "e3e4" }

        it "returns failure" do
          expect(board.move(:ply => ply).success?).to eql(false)
        end

        it "does not move any piece" do
          board.move(:ply => ply)
          expect(mapped_board).to eql(STARTING_BOARD)
        end

        it "is still white's turn" do
          board.move(:ply => ply)
          expect(board.is_white_turn).to eql(true)
        end
      end

      context "when moving a black piece" do
        let(:move) { "e7e5" }

        it "returns failure" do
          expect(board.move(:ply => ply).success?).to eql(false)
        end

        it "does not move any piece" do
          board.move(:ply => ply)
          expect(mapped_board).to eql(STARTING_BOARD)
        end

        it "is still white's turn" do
          board.move(:ply => ply)
          expect(board.is_white_turn).to eql(true)
        end
      end
    end
  end
end
