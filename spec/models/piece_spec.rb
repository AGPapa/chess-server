require "rails_helper"

RSpec.describe Piece do
  describe ".initialize" do
    let(:piece) { described_class.new(:side => side) }

    context "when the piece is white" do
      let(:side) { "white" }

      it ".white? returns true" do
        expect(piece.white?).to eql(true)
      end

      it ".black? returns false" do
        expect(piece.black?).to eql(false)
      end

      it ".empty? returns false" do
        expect(piece.empty?).to eql(false)
      end
    end

    context "when the piece is black" do
      let(:side) { "black" }

      it ".white? returns false" do
        expect(piece.white?).to eql(false)
      end

      it ".black? returns true" do
        expect(piece.black?).to eql(true)
      end

      it ".empty? returns false" do
        expect(piece.empty?).to eql(false)
      end
    end

    context "when the piece is empty" do
      let(:side) { "empty" }

      it ".white? returns false" do
        expect(piece.white?).to eql(false)
      end

      it ".black? returns false" do
        expect(piece.black?).to eql(false)
      end

      it ".empty? returns true" do
        expect(piece.empty?).to eql(true)
      end
    end

    context "when the piece is not white, black or empty" do
      let(:side) { "garbage" }

      it "raises an error" do
        expect do
          piece.white?
        end.to raise_error(RuntimeError, /Invalid side/)
      end
    end
  end
end
